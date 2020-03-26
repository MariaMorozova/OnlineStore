import 'package:flutter/material.dart';
import 'package:onlinestore/categories/categories.dart';
import 'categories.dart';

class CategoriesGridViewItem extends StatelessWidget{
  Categories categories;

  CategoriesGridViewItem(Categories categories)
  {
    this.categories = categories;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        child:
        Column(
          children: <Widget>[
            Image.network(categories.imageUrl, height: 100, ),
            //Text(categories.title),
          ],

        )
    );
  }


}