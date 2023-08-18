import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../domain/models/models.dart';
import '../resource_data/assets_manager.dart';
import '../resource_data/color_manager.dart';
import '../resource_data/route_manager.dart';
import '../resource_data/values_managers.dart';

class CardItem extends StatelessWidget {
  final ItemModel item;
  final BuildContext ctx;

  const CardItem({super.key, required this.item, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Close the keyboard
            FocusScope.of(ctx).unfocus();

            Navigator.of(ctx)
                .pushNamed(Routes.articlesDetails, arguments: item);
          },
          child: Stack(children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: AppSize.s8,
              shadowColor: Colors.green,
              margin: const EdgeInsets.only(
                  left: AppMargin.m20,
                  right: AppMargin.m20,
                  top: AppMargin.m20),
              child: SizedBox(
                width: MediaQuery.of(ctx).size.width,
                height: AppSize.s300,
                child: CachedNetworkImage(
                  imageUrl: item.urlToImage,
                  fit: BoxFit.cover,
                  // I put Lotiie json instead the (image placehodler) you sent to me in folder slicing
                  placeholder: (ctx, url) {
                    return Lottie.asset(JsonAssets.loading);
                  },
                  errorWidget: (ctx, url, error) => Center(
                    child: Lottie.asset(JsonAssets.loading),
                  ),
                ),
              ),
            ),
          ]),
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
                      item.title,
                      style: const TextStyle(color: ColorManager.black),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p5),
                    child: Text(
                      "By ${item.author}",
                      style: const TextStyle(color: ColorManager.grey),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p5),
                    child: Text(
                      item.publishedAt,
                      style: const TextStyle(color: ColorManager.grey),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
