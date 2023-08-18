import 'package:flutter/material.dart';
import 'package:link_development_task/presentation/articles_details/view/articles_details.dart';

import '../../app/di.dart';
import '../articles/view/home_articles.dart';
import '../resource_data/strings_manager.dart';

class Routes {
  static const String homeArticles = "/";
  static const String articlesDetails = "/articles_details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeArticles:
        initMoviesModule();
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (context) => const Home());
      case Routes.articlesDetails:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (context) => const ArticlesDetails());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      );
    });
  }
}
