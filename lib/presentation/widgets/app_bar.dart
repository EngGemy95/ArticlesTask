import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:link_development_task/presentation/widgets/search_bar_delegate.dart';

import '../../domain/models/models.dart';
import '../resource_data/color_manager.dart';
import '../resource_data/route_manager.dart';

PreferredSizeWidget showAppBar(
    String title,
    BuildContext context,
    List<ItemModel> itemList,
    bool isOpenDrawer,
    GlobalKey<ScaffoldState> _key) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: ColorManager.black, // for android
      statusBarIconBrightness: Brightness.light, // for android
      statusBarBrightness: Brightness.light, // for ios
    ),
    backgroundColor: ColorManager.black,
    title: Text(title),
    centerTitle: true,
    actions: [
      IconButton(
        icon: const Icon(
          Icons.search,
          color: ColorManager.white,
        ),
        onPressed: () {
          showSearch(context: context, delegate: SearchBarDelegate(itemList));
        },
      ),
    ],
    leading: isOpenDrawer
        ? IconButton(
            onPressed: () {
              isOpenDrawer ? _key.currentState!.openDrawer() : null;
            },
            icon: const Icon(
              Icons.menu,
              color: ColorManager.white,
            ),
          )
        : IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.homeArticles);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorManager.white,
            ),
          ),
  );
}
