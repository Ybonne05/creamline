import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

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
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                    child: Text ('Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
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
        ),
      ),
    );
  }
}
