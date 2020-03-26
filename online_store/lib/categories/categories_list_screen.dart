import 'package:flutter/material.dart';
import 'categories.dart';
import 'categories_api.dart';

import 'package:http/http.dart' as http;

class CategoriesListScreen extends StatefulWidget {
  @override
  _CategoriesListScreen createState() => _CategoriesListScreen();
}

class _CategoriesListScreen extends State<CategoriesListScreen> {
  FutureBuilder<List<Categories>> _buildBody;

  @override
  Widget build(BuildContext context) {
    _buildBody = FutureBuilder<List<Categories>>(
      future: CategoriesApi.loadProductList(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? CategoriesList(categories: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          centerTitle: true,

        ),
        body: _buildBody
    );
  }
}
