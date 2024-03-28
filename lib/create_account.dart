import 'package:flutter/material.dart';
import 'package:shinespy/component/bottombar.dart';
import 'package:shinespy/login.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120), // Added space before the text
              Text(
                'Create My Account',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 60), // Added space after the text
              SizedBox(
                width: 324.0,
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Color(0x679B9B9B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 324.0,
                height: 43.0,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0x679B9B9B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    suffixIcon: Icon(Icons.lock, color: Colors.black), // Lock icon
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 324.0,
                height: 43.0,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    filled: true,
                    fillColor: Color(0x679B9B9B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    suffixIcon: Icon(Icons.lock, color: Colors.black), // Lock icon
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 324.0,
                height: 56.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNav()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEFE8A2),
                  ),
                  child: Text(
                    'Create My Account',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF000000)),
                  ),
                ),
              ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
              );
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already registered? ',
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: 'Log In',
                    style: TextStyle(
                      color: Colors.btncolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
