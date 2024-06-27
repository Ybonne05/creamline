import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';

class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        color:Colors.pink[100],
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(product.productName,
                style: TextStyle(
                  fontSize : 20.0,
                ),),
              Text('${product.price}',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        )
    );
  }
}
