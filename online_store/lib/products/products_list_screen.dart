import 'package:flutter/material.dart';
import 'package:onlinestore/categories/categories_list_screen.dart';
import 'products.dart';
import 'products_api.dart';

import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreen createState() => _ProductListScreen();
}

class _ProductListScreen extends State<ProductListScreen> {
  FutureBuilder<List<Product>> _buildBody;

  @override
  Widget build(BuildContext context) {
    _buildBody = FutureBuilder<List<Product>>(
      future: ProductApi.loadProductList(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? ProductsList(products: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Online store"),
          centerTitle: true,
          //Extract to _buildActions
          actions: <Widget> [
            IconButton(
                icon: Icon(Icons.category, color: Colors.white,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesListScreen()));
                }),
          ],
        ),
        body: _buildBody

      /*drawer: Drawer(
        child: Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: Text("User name"),
                accountEmail: Text("User email"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),)
          ],
        ),
      ),*/ //Drawer
    );



  }
}
