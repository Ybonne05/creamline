import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';
import 'package:flutterapps/services/MenuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Creamline Ice Cream Black", price: 30.00),
    Product(productName: "Creamline Ice Cream Purple", price: 45.00),
    Product(productName: "Creamline Ice Cream Green", price: 40.00),
    Product(productName: "Creamline Ice Cream Gray", price: 60.00),
    Product(productName: "Creamline Ice Cream Pink", price: 50.00),
  ];

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
        padding: EdgeInsets.all(5.0),

        child: Column(
          children: products.map((product)=>Menucard(product: product)).toList(),
        ),
      ),
    );
  }
}


