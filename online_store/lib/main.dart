import 'package:flutter/material.dart';
import 'products/products_list_screen.dart';
import 'categories/categories_list_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Online store DEMO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}
