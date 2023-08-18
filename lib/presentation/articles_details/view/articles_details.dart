import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:link_development_task/app/responsive.dart';
import 'package:lottie/lottie.dart';
import '../../../domain/models/models.dart';
import '../../resource_data/assets_manager.dart';
import '../../resource_data/color_manager.dart';
import '../../resource_data/strings_manager.dart';
import '../../resource_data/values_managers.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer_header.dart';
import '../../widgets/drawer_items.dart';
import '../../widgets/website_button.dart';

class ArticlesDetails extends StatefulWidget {
  const ArticlesDetails({Key? key}) : super(key: key);

  @override
  State<ArticlesDetails> createState() => _ArticlesDetailsState();
}

class _ArticlesDetailsState extends State<ArticlesDetails> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key

    final articleDetails =
        ModalRoute.of(context)!.settings.arguments as ItemModel;

    List<ItemModel> articles = [];

    return Responsive(
      mobile: getMobileUI(articles, articleDetails, key),
      tablet: Container(),
      desktop: Container(),
    );
  }

  Widget getMobileUI(List<ItemModel> articles, ItemModel articleDetails,
      GlobalKey<ScaffoldState> key) {
    return Scaffold(
      backgroundColor: ColorManager.whiteGrey,
      appBar:
          showAppBar(AppStrings.linkDevelopment, context, articles, false, key),
      body: Column(
        children: [
          Stack(
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: AppSize.s8,
                shadowColor: Colors.green,
                margin: const EdgeInsets.only(
                    left: AppMargin.m20,
                    right: AppMargin.m20,
                    top: AppMargin.m20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: AppSize.s300,
                  child: CachedNetworkImage(
                    imageUrl: articleDetails.urlToImage,
                    fit: BoxFit.cover,

                    // I put Lotiie json instead the (image placehodler) you sent to me in folder slicing
                    placeholder: (context, url) {
                      return Lottie.asset(JsonAssets.loading);
                    },
                    errorWidget: (context, url, error) => Center(
                      child: Lottie.asset(JsonAssets.loading),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  margin: const EdgeInsets.all(AppMargin.m20),
                  child: Text(
                    articleDetails.publishedAt,
                    style: const TextStyle(color: ColorManager.white),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(
                left: AppMargin.m20,
                right: AppMargin.m20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(AppPadding.p10),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(AppPadding.p5),
                      child: Text(
                        articleDetails.title,
                        style: const TextStyle(color: ColorManager.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(AppPadding.p5),
                      child: Text(
                        "By ${articleDetails.author}",
                        style: const TextStyle(color: ColorManager.grey),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(AppPadding.p5),
                      child: Text(
                        articleDetails.description,
                        style: const TextStyle(color: ColorManager.grey),
                      ),
                    ),
                  ),
                ],
              )),
          Center(
            child: WebsiteButton(articleDetails.url),
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
