import 'package:flutter/material.dart';
import 'package:link_development_task/presentation/resource_data/assets_manager.dart';
import 'package:link_development_task/presentation/resource_data/color_manager.dart';
import 'package:link_development_task/presentation/resource_data/values_managers.dart';

import '../resource_data/font_manager.dart';
import '../resource_data/style_manager.dart';

class CustomDrawerHeader extends StatefulWidget {
  const CustomDrawerHeader({super.key});

  @override
  State<CustomDrawerHeader> createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorManager.whiteGrey,
        width: double.infinity,
        height: AppSize.s200,
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p20, horizontal: AppPadding.p10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: AppMargin.m10),
                height: AppSize.s70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.profile),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: getMediumStyle(
                        fontSize: FontSize.s14, color: ColorManager.grey),
                  ),
                  Text(
                    "Tony Roshdy",
                    style: getMediumStyle(
                        fontSize: FontSize.s16, color: ColorManager.black),
                  )
                ],
              ),
            ),
            Expanded(
                child: Image.asset(
              ImageAssets.arrow,
              width: AppSize.s50,
              height: AppSize.s50,
            ))
          ],
        ),
      ),
    );
  }
}
