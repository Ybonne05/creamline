import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';
import 'package:flutterapps/services/MenuCard.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({super.key});


  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  fetchData() async{
    final response = await http.get(Uri.parse('http://192.168.192.0:8080/products')
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

    );
  }
}


