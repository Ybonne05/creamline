import 'package:flutter/material.dart';
import 'package:flutterapps/services/Product.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(widget.product.productName),
              Text(widget.product.description),
            ],
           ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   '₱ ${totalAmount.toString()}',
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
                         fontSize: 20.0,
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
    );
  }
}
