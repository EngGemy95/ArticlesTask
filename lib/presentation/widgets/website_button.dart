import 'package:flutter/material.dart';
import 'package:link_development_task/presentation/resource_data/color_manager.dart';
import 'package:link_development_task/presentation/resource_data/strings_manager.dart';
import 'package:link_development_task/presentation/resource_data/style_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resource_data/values_managers.dart';

class WebsiteButton extends StatelessWidget {
  final String websiteUrl;

  const WebsiteButton(this.websiteUrl, {super.key});

  void _launchURL() async {
    final Uri url = Uri.parse(websiteUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * Percentages.percentage_0_6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorManager.black),
        onPressed: _launchURL,
        child: Text(
          AppStrings.openWebSite,
          style: getMediumStyle(color: ColorManager.white),
        ),
      ),
    );
  }
}
