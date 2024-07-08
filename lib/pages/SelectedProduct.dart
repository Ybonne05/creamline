import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';

class Selectedproduct extends StatefulWidget {
  final Product product;
  const Selectedproduct({super.key, required this.product});

  @override
  State<Selectedproduct> createState() => _SelectedproductState();
}

class _SelectedproductState extends State<Selectedproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Order',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      body: Column(
        children: [
        Text(widget.product.productName),
        Text(widget.product.description),
        Text(widget.product.price.toString()),
        ],
      ),
    );
  }
}
