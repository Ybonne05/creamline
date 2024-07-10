import 'package:flutter/material.dart';
import 'package:flutterapps/Home.dart';
import 'package:flutterapps/pages/dashboard.dart';
import 'package:flutterapps/pages/login.dart';
import 'package:flutterapps/pages/menu.dart';
import 'package:flutterapps/pages/signup.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
  },
));




