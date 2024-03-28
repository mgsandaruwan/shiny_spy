import 'package:flutter/material.dart';
import 'package:shinespy/create_account.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 300),
              Center(
                child: Text(
                  'Sign Up Now',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color:Colors.white ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity, // Making button width dynamic
                height: 56,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.phone_android, color: Colors.black),
                  label: Text(
                    'Continue with Email or Mobile',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEFE8A2),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Or continue with',
                style: TextStyle(color: Color(0xFFFFFFFF)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity, // Making button width dynamic
                height: 56,
                child: ElevatedButton.icon(
                  icon: Image.asset('images/google.png', height: 24),
                  label: Text('Google'),
                  onPressed: () {
                    // Your Google sign-in logic
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
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
