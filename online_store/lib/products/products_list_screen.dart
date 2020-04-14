import 'package:flutter/material.dart';
import 'package:onlinestore/categories/categories_list_screen.dart';
import 'package:onlinestore/products/product_grid_view_Item.dart';
import 'products.dart';
import 'products_api.dart';
import 'package:onlinestore/base_api.dart';

import 'package:http/http.dart' as http;

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

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreen createState() => _ProductListScreen();
}

class _ProductListScreen extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: _buildBody(),

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

  FutureBuilder<List<Product>> _buildBody() {
    return FutureBuilder<List<Product>>(
      future: BaseApi.loadJson(http.Client(), ProductApi.productUrl).then((value) => ProductApi.loadProductList(value)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? ProductsList(products: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}


