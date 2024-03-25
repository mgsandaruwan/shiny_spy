import 'package:flutter/material.dart';
import 'package:shinespy/welcome_screen.dart';

void main() {
  runApp(shinespy());
}

class shinespy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: WelcomeScreen(),
    );
  }
}

