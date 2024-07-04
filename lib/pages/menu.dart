import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';
import 'package:flutterapps/services/MenuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});


  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  fetchData() async{
    final response = await http.get(Uri.parse('http://192.168.194.26:8080/products')
    );
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
              return Padding(padding: EdgeInsets.all(3.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Column(
                          children: [
                            Text(products[index].productName),
                            Text(products[index].price.toString()),
                          ],
                        ),

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


