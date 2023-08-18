import 'dart:convert';

import 'package:link_development_task/data/mapper/mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/response/response.dart';
import '../domain/models/models.dart';
import '../presentation/resource_data/strings_manager.dart';

class AppPreference {
  final SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);

  // We Can Cach the Articles and If there is no internet we can show the cached articles
  Future<void> setCachedArticles(
      String type, List<ItemResponse> itemsResponse) async {}

  List<ItemModel>? getCachedArticles(String type) {
    return [];
  }
}
