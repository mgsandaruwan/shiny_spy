import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shinespy/createaccountscreen.dart';
import 'package:shinespy/loginscreen.dart';
import 'package:shinespy/signUpscreen.dart';
import 'package:shinespy/welcome_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

