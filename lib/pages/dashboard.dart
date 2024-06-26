import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
      ),
      body: Column(
        children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/menu');
              },
              child: Text('Go to Menu'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Go to Profile'),
          ),
        ],
      ),
    );
  }
}