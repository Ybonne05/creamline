import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapps/services/User.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();

  Future login(User user)async{
    final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
    headers: <String, String>{
      'Content-Type' : 'application/json; charsert=UTF-8'
    },
    body: jsonEncode(<String, dynamic>{
      'usernameOrEmail' : user.email,
      'password' : user.password
    }),
    );
    if (response.statusCode == 200){
      return true;
    }
    return false;
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 50.0,),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(

                        label: Text('Email'),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your email';
                        }
                        if(value.length < 2){
                          return 'Wrong Email';
                        }
                        return null;
                      },
                        onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 30.0,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        labelStyle: TextStyle(
                          color: Colors.black,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      User user = User(
                        username: '',
                        email: email,
                        password: password
                      );
                      /*if (login(user)){
                      Navigator.pushReplacementNamed(context, '/');
                      }*/
                      setState(() {
                        buttonContent = FutureBuilder(
                            future: login(user),
                            builder: (context, snapshots){
                              if (snapshots.connectionState == ConnectionState.waiting){
                                return loadingDisplay;
                              }
                              if (snapshots.hasData){
                              }
                              return Text('Log in');
                            }
                        );
                      });
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                    child: buttonContent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[300],
                        foregroundColor: Colors.black,
                        ),
                      ),
              Divider(
                height: 55.0,
                color: Colors.black,
                thickness: 1.0,
              ),
              SizedBox(height: 20.0,),
              Column(
                children: [
                  Text('Sign in with',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 40.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(onPressed: (){},
                        child: Text ('Login with Facebook'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(onPressed: (){},
                    child: Text ('Login with Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text('Already have an account?',
                  style: TextStyle(
                    color: Colors.grey[700]
                  ),
                  ),
                  SizedBox(width: 30.0,),
                  InkWell(
                    child: Text(
                      'Signup here!',
                      style: TextStyle(
                        color: Colors.yellow[800]
                      ),
                    ),
                    onTap: ()=> Navigator.popAndPushNamed(context, '/signup'),
                  ),
                ],
              ),
            ],
          ),
          ],
        ),
      ),
      ),
    );
  }
}
