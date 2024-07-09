import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutterapps/services/User.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  createAccount(User user) async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/register/user'),
      headers:<String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, dynamic>{
        'username' : user.username,
        'email' : user.email,
        'password' : user.password,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Lets Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 30.0,),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      maxLength: 40,
                      decoration: InputDecoration(
                        label: Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your name';
                        }
                        if(value.length < 2){
                          return 'It should be at least 3 letters long';
                        }
                        return null;
                      },
                      onSaved: (value){
                        name = value!;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      maxLength: 40,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your email';
                        }
                        if(value.length < 2){
                          return 'It should be a combination of numbers and letters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureIcon),
                          onPressed: (){
                            setState(() {
                              _obscure = !_obscure;
                              if(_obscure){
                                _obscureIcon = Icons.visibility_off;}
                              else{
                                _obscureIcon = Icons.visibility;}
                              }
                            );
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your password';
                        }
                        if(value.length < 8){
                          return 'It should be at least 8 characters';
                        }
                        if(value.length > 20){
                          return 'It must be maximum of 20 characters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        label: Text('Confirm Password'),
                        prefixIcon: Icon(Icons.lock_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureIcon),
                          onPressed: (){
                            setState(() {
                              _obscure = !_obscure;
                              if(_obscure){
                                _obscureIcon = Icons.visibility_off;}
                              else{
                                _obscureIcon = Icons.visibility;}
                            }
                            );
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your password';
                        }
                        if(value.length < 8){
                          return 'It should be at least 8 characters';
                        }
                        if(value.length > 20){
                          return 'It must be maximum of 20 characters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0,),
                ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    User user = User(
                      username: name,
                      email: email,
                      password: password
                    ) ;
                    createAccount(user);
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                    child: Text ('Sign up'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100],
                      foregroundColor: Colors.black,
                    ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
