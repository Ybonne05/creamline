import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';
import 'package:http/http.dart' as http;

class Selectedproduct extends StatefulWidget {
  final Product product;
  const Selectedproduct({super.key, required this.product});

  @override
  State<Selectedproduct> createState() =>
      _SelectedproductState(product: product);
}

class _SelectedproductState extends State<Selectedproduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;
  _SelectedproductState({required this.product});


  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text('Order',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      body:
      SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 80.0, 0, 0),
              child: Center(
                child: Image(
                  image: AssetImage('assets/creamline-cookies-cream.jpg'),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.product.productName,
                  style: TextStyle(
                    fontFamily: 'Playwrite',
                    ),
                ),
                Text(widget.product.description,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
             ),
          ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   '₱ ${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                     fontSize: 30.0,
                   ),
                 ),
                 Row(
                   children: [
                     IconButton(onPressed: (){
                       setState(() {
                         if (numberOfOrders > 1) {
                           numberOfOrders -= 1;
                           totalAmount = product.price * numberOfOrders;
                         }
                       });
                     },
                         icon: Icon(Icons.remove)
                     ),
                     Text(
                       numberOfOrders.toString(),
                       style: TextStyle(
                         fontSize: 30.0,
                       ),
                     ),
                     IconButton(onPressed: (){
                       setState(() {
                         numberOfOrders += 1;
                         totalAmount = product.price * numberOfOrders;
                       });
                     },
                         icon: Icon(Icons.add)
                     ),
                   ],
                 ),
               ],
             ),
           ],
         ),
      ),
    );
  }
}
