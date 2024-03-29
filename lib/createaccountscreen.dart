import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'component/bottombar.dart';
import 'loginscreen.dart';


class CreateAccountScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _signUp(BuildContext context) async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Navigate to next screen after successful signup
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } else {
        // Passwords don't match
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Passwords do not match"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to create account: $e"),
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
              SizedBox(height: 120), // Added space before the text
              Text(
                'Create My Account',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 60), // Added space after the text
              SizedBox(
                width: 324.0,
                height: 43.0,
                child: TextField(
                  controller: emailController,
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
              SizedBox(height: 20),
              SizedBox(
                width: 324.0,
                height: 43.0,
                child: TextField(
                  controller: confirmPasswordController,
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
                    suffixIcon: Icon(Icons.lock, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 324.0,
                height: 56.0,
                child: ElevatedButton(
                  onPressed: () => _signUp(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEFE8A2),
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
