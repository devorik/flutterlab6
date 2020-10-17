import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Hello Flutter',
            style:
                TextStyle(color: Colors.red.withOpacity(1.0), fontSize: 35.0),
          ),
        ),
      ),
    );
  }
}
