import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';

import '../pages/SelectedProduct.dart';

class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(

      clipBehavior: Clip.hardEdge,
      color: Colors.pink[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 30.0, 2.0, 30.0),
        child: ListTile(
          title: Column(
            children: [
              Center(
                child: Text(
                    product.productName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                    fontSize: 17.0
                  ),
                ),
              ),

            ],
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Selectedproduct(product: product),
              ),
            );
          },

        ),
      ),
    );
  }
}
