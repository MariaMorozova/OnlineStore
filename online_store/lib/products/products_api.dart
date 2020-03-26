import 'package:onlinestore/products/product_grid_view_Item.dart';

import 'products.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static List<Product> parseProductList(String responseBody) {
    final jsonData = json.decode(responseBody);
    var data = jsonData["data"] as List;
    return data.map<Product>((json) => Product.fromJson(json)).toList();
  }
/*Products parsingProduct(String responseBody) {
  final parsed = Product.fromJson(json.decode(responseBody));
  return parsed;
}*/

  static Future<List<Product>> loadProductList(http.Client client) async {
    final response =
    await client.get('http://ostest.whitetigersoft.ru/api/common/product/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');
    return parseProductList(response.body);
  }
}

class ProductsList extends StatelessWidget {
  final List<Product> products;

  ProductsList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
        return ProductGridViewItem(product);
      },
    );

  }
}
