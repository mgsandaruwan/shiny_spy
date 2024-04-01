import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'component/bottombar.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to next screen after successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign in: $e"),
        ),
      );
    }
  }

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
              SizedBox(height: 190),
              Text(
                'Welcome Back',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 312.0,
                height: 43.0,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email/Phone Number',
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
                width: 312.0,
                height: 43.0,
                child: TextField(
                  controller: passwordController,
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
                    suffixIcon: Icon(Icons.lock, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 312.0,
                height: 56.0,
                child: ElevatedButton(
                  onPressed: () => _signIn(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEFE8A2),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF000000)),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add forgot password functionality here
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Or continue with',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 312.0,
                height: 56,
                child: ElevatedButton.icon(
                  icon: Image.asset('images/google.png', height: 24),
                  label: Text('Google'),
                  onPressed: () {
                    // Your Google sign-in logic
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
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
