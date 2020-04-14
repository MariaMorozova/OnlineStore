import 'package:onlinestore/base_api.dart';
import 'products.dart';

import 'dart:async';
import 'dart:convert';

class ProductApi extends BaseApi {
  static String productUrl = 'common/product/list?';
  static Future<List<Product>> loadProductList(String responseBody) async {
    final jsonData = json.decode(responseBody);
    var data = jsonData["data"] as List;
    return data.map<Product>((json) => Product.fromJson(json)).toList();
  }
}




