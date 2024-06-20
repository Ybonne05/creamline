import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home:Scaffold  (
     appBar: AppBar(
       title: Text('User Profile',
         style: TextStyle(
         fontWeight: FontWeight.bold,
         ),
       ),
       backgroundColor: Colors.pink[300],
       centerTitle: true,
     ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Text(
                'NAME :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  height: 3.0,
                ),
              ),
              Text(
                'Ybonne B. Legaspi',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0,),
              Text(
                'YEAR :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                '4TH YEAR',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0,),
              Text(
                'Email :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                'ybonnelegaspi0823@gmail.com',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
        ),
      ),
    ),
  ),
);

