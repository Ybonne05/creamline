import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';
import 'package:flutterapps/services/MenuCard.dart';
import 'package:flutterapps/pages/SelectedProduct.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});


  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  List<Widget> productcards = <Widget>[];
  Future<List<dynamic>>fetchData() async{
    final response = await http.get
      (Uri.parse('http://10.0.2.2:8080/api/v1/product/all'));

    final data = jsonDecode(response.body);
    // print(data);
    List products = <Product>[];

    for (var product in data) {
      products.add(Product.fromJson(product));
    }
   return products;
  }

  List<Widget> createcards (List<dynamic> products){
    List<Widget> productcards = <Widget>[];
    for(var product in products){
      productcards.add(Menucard(product: product,));
    }
    return productcards;
  }

  @override
  void initState() {
    super.initState();
    products = fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Menu',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      body: FutureBuilder(
              future: products,
              builder: (context, snapshots){
                if (snapshots.connectionState == ConnectionState.waiting){
                  return Center(
                    child: SpinKitFoldingCube(
                      color: Colors.white,
                      size: 60.0,
                    ),
                  );
                }
                if (snapshots.hasData) {
                  List products = snapshots.data!;
                  productcards = createcards(products);
                  return ResponsiveGridList(
                      horizontalGridSpacing: 10, // Horizontal space between grid items
                      verticalGridSpacing: 10, // Vertical space between grid items
                      horizontalGridMargin: 20, // Horizontal space around the grid
                      verticalGridMargin: 20, // Vertical space around the grid
                      minItemWidth: 500, // The minimum item width (can be smaller, if the layout constraints are smaller)
                      minItemsPerRow: 2, // The minimum items to show in a single row. Takes precedence over minItemWidth
                      maxItemsPerRow: 20, // The maximum items to show in a single row. Can be useful on large screens
                      listViewBuilderOptions: ListViewBuilderOptions(), // Options that are getting passed to the ListView.builder() function
                      children: productcards, // The list of widgets in the list
                  );
                }
                return Center(
                  child: Text('Unable to load data'),
                );
              },
            ),
    );
  }
}


