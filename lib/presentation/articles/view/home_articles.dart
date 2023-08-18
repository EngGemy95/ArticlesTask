import 'package:flutter/material.dart';
import 'package:link_development_task/app/responsive.dart';
import 'package:link_development_task/presentation/articles/viewmodel/home_articles_view_model.dart';
import 'package:link_development_task/presentation/widgets/app_bar.dart';
import 'package:link_development_task/presentation/widgets/card_item.dart';
import 'package:link_development_task/presentation/widgets/drawer_header.dart';

import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../../app/functions.dart';
import '../../../domain/models/models.dart';
import '../../resource_data/color_manager.dart';
import '../../resource_data/strings_manager.dart';
import '../../widgets/drawer_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeArticlesViewModel _viewModel = instance<HomeArticlesViewModel>();

  final _controller = ScrollController();
  bool isFetchedDataDone = true;

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _bind() {
    _viewModel.isRequestFailedStreamController.stream.listen((failure) async {
      //show popUp error
      showCustomDialogOfRequests(
          context,
          getErrorPopupDialog(
              context, popUpErrorChildren(context, failure.message)));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFetchedDataDone) {
      _viewModel.setSource(Constants.theNextWeb);
      _viewModel.setApiKey(Constants.apiKey);
      _viewModel.getArticles(_viewModel.getSource(), _viewModel.getApiKey());

      isFetchedDataDone = false;
    }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    List<ItemModel> articles = [];

    return Responsive(
      mobile: getMobileUI(articles),
      tablet: Container(),
      desktop: Container(),
    );
  }

  Widget getMobileUI(List<ItemModel> articles) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      backgroundColor: ColorManager.whiteGrey,
      appBar:
          showAppBar(AppStrings.linkDevelopment, context, articles, true, _key),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<ItemModel>>(
                stream: _viewModel.outputArticles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    articles.addAll(snapshot.data!);
                    return ListView.separated(
                      key: snapshot.data!.isNotEmpty
                          ? ObjectKey(snapshot.data?[0] ?? 0)
                          : const ObjectKey("-"),
                      controller: _controller,
                      itemBuilder: (ctx, index) {
                        return snapshot.data!.isNotEmpty
                            ? CardItem(
                                item: snapshot.data![index],
                                ctx: ctx,
                              )
                            : const Center(
                                child: Text(
                                  "No Articles",
                                  style: TextStyle(color: ColorManager.white),
                                ),
                              );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: snapshot.data?.length ?? 0,
                    );
                  }
                }),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomDrawerHeader(),
              customDrawerItems(context),
            ],
          ),
        ),
      ),
    );
  }
}
