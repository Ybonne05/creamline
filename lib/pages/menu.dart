import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';
import 'package:flutterapps/services/MenuCard.dart';
import 'package:flutterapps/pages/SelectedProduct.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});


  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder(
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
              return Padding(padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.pink[200],
                      child: ListTile(
                        title: Column(
                          children: [
                            Text(products[index].productName),

                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Selectedproduct(product: products[index]),
                            ),
                          );
                        },

                      ),
                    );
                  }
                ),
              );
            }
            return Center(
              child: Text('Unable to load data'),
            );
          },
        ),
      ),
    );
  }
}


