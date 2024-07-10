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
      body:
       SafeArea(
         child: Column(
           children: [
             Container(
               child: Padding(
                 padding: EdgeInsets.fromLTRB(0, 80.0, 0, 0),
                 child: Center(
                   child: Image(
                     image: AssetImage('assets/creamline.png'),
                   ),
                 ),
               ),
             ),
             SizedBox(height: 200.0,),
             Column(
               children: [
                 ElevatedButton(
                   onPressed: (){
                     Navigator.pushNamed(context, '/menu');
                   },
                   child: Text('          Menu         ',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                   ),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.pink[200],
                     foregroundColor: Colors.black,
                   ),
                 ),
                 SizedBox(height: 30.0,),
                 ElevatedButton(
                   onPressed: (){
                     Navigator.pushNamed(context, '/profile');
                   },
                   child: Text('         Profile        ',
                     style: TextStyle(
                       fontFamily: 'Oswald',
                       fontSize: 25.0,
                       color: Colors.black,
                     ),
                   ),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.pink[200],
                       foregroundColor: Colors.black,
                      ),
                   ),
               ],
             ),
           ],
         ),
       ),
    );
  }
}