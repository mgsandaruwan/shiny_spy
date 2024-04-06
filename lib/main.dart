import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shinespy/articlecard.dart';
import 'package:shinespy/createaccountscreen.dart';
import 'package:shinespy/loginscreen.dart';
import 'package:shinespy/pages/aboutUspage.dart';
import 'package:shinespy/pages/home.dart';
import 'package:shinespy/pages/licensespage.dart';
import 'package:shinespy/pages/settings.dart';
import 'package:shinespy/popup_screen.dart';
import 'package:shinespy/signUpscreen.dart';
import 'package:shinespy/welcome_screen.dart';

import 'component/bottombar.dart';
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

