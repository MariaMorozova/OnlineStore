import 'categories_api.dart';
import 'categories.dart';
import 'categories_grid_view_item.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinestore/base_api.dart';

class CategoriesList extends StatelessWidget {
  final List<MyCategory> categories;

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

class CategoriesListScreen extends StatefulWidget {
  @override
  _CategoriesListScreen createState() => _CategoriesListScreen();
}

class _CategoriesListScreen extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          centerTitle: true,
        ),
        body: _buildBody(),
    );
  }

  FutureBuilder<List<MyCategory>> _buildBody() {
    return FutureBuilder<List<MyCategory>>(
      future:  BaseApi.loadJson(http.Client(), CategoryApi.categoryUrl).then((value) => CategoryApi.loadCategoriesList(value)),
      builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? CategoriesList(categories: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
    );
  }
}
