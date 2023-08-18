import 'package:flutter/material.dart';

import '../../app/functions.dart';
import '../resource_data/assets_manager.dart';
import '../resource_data/color_manager.dart';
import '../resource_data/font_manager.dart';
import '../resource_data/style_manager.dart';
import '../resource_data/values_managers.dart';

Widget customDrawerItems(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: AppPadding.p15),
    child: Column(children: [
      menuItem(context, ImageAssets.explore, "Explore"),
      menuItem(context, ImageAssets.live, "Live Chat"),
      menuItem(context, ImageAssets.gallery, "Gallery"),
      menuItem(context, ImageAssets.wishlist, "Wish List"),
      menuItem(context, ImageAssets.eMagazine, "E-Magazine")
    ]),
  );
}

Widget menuItem(BuildContext context, image, String sectionName) {
  return Material(
    child: InkWell(
      onTap: () {
        Navigator.pop(context); // Close the drawer
        // show popup that have the section name
        showSectionPopup(context, sectionName);
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    image,
                    width: AppSize.s30,
                    height: AppSize.s30,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    sectionName,
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
