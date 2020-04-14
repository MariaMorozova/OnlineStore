import 'package:flutter/material.dart';
import 'products.dart';

class ProductGridViewItem extends StatelessWidget{
  Product product;

  ProductGridViewItem(Product product)
  {
    this.product = product;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Column(
          children: <Widget>[
            Image.network(product.imageUrl, height: 100, ),
            Text(product.title),
            Text(product.price.toString() + " руб"),
          ],
        )
    );
  }


}