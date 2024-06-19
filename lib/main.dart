import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold  (
      appBar: AppBar(
        title: Center(
          child: Text('CREAMLINE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.pink[300],
      ),
      body: Center(
        child: Image.network('https://www.pinoy-entrepreneur.com/wp-content/uploads/2010/10/creamline_logo.jpg'),
        //Text(
        //  'This is my App',
        // style: TextStyle(
        // fontSize: 30.0,
        //fontWeight: FontWeight.bold,
        //fontFamily:  'Raleway',
        //color: Colors.black87,
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
//       child: Text('Click It',
//       style: TextStyle(
//       fontWeight: FontWeight.bold,
        backgroundColor: Colors.pink[200],
        child: Icon(
            Icons.add,
            color: Colors.black87,
            ),
          ),
        ),
      ),
    );
}
