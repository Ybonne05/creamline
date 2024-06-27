import 'package:flutter/material.dart';
import 'package:flutterapps/Home.dart';
import 'package:flutterapps/pages/dashboard.dart';
import 'package:flutterapps/pages/menu.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/menu",
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
  },
));




