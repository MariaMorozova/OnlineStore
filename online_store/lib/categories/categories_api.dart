import 'categories.dart';
import 'dart:convert';
import 'package:onlinestore/base_api.dart';

class CategoryApi extends BaseApi {
  static String categoryUrl = 'common/category/list?';
  static List<MyCategory> loadCategoriesList(String responseBody) {
    final jsonData = json.decode(responseBody);
    var data = jsonData["data"];
    var categories = data["categories"] as List;
    return categories.map<MyCategory>((json) => MyCategory.fromJson(json)).toList();
  }
}
