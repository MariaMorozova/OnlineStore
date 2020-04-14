import 'package:onlinestore/base_api.dart';
import 'products.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductApi {
  static List<Product> parseProductList(String responseBody) {
    final jsonData = json.decode(responseBody);
    var data = jsonData["data"] as List;
    return data.map<Product>((json) => Product.fromJson(json)).toList();
  }

  static Future<List<Product>> loadProductList(http.Client client) async {
    final response =
    await client.get(BaseApi.baseApiUrl + "common/product/list?" + BaseApi.apiKey);
      return parseProductList(response.body);
  }
}




