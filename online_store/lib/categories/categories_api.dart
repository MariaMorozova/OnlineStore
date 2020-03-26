import 'categories.dart';
import 'categories_grid_view_item.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesApi {
  static List<Categories> loadCategoriesList(String responseBody) {
    final jsonData = json.decode(responseBody);
    var data = jsonData["data"] as List;
    return data.map<Categories>((json) => Categories.fromJson(json)).toList();
  }

  static Future<List<Categories>> loadProductList(http.Client client) async {
    final response =
    //await client.get('http://ostest.whitetigersoft.ru/api/common/category/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');
    await client.get('http://ostest.whitetigersoft.ru/api/common/product/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');
    return loadCategoriesList(response.body);
  }
}

class CategoriesList extends StatelessWidget {
  final List<Categories> categories;

  CategoriesList({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var product = categories[index];
        return CategoriesGridViewItem(product);
      },
    );

  }
}