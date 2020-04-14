import 'package:onlinestore/base_api.dart';
import 'categories.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryApi {
  static List<MyCategory> loadCategoriesList(String responseBody) {
    final jsonData = json.decode(responseBody);
    var data = jsonData["data"];
    var categories = data["categories"] as List;
    return categories.map<MyCategory>((json) => MyCategory.fromJson(json)).toList();
  }

  static Future<List<MyCategory>> loadCategories(http.Client client) async {
    final response = await client.get(BaseApi.baseApiUrl + 'common/category/list?' + BaseApi.apiKey);
    return loadCategoriesList(response.body);
  }
}
