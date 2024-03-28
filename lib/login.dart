import 'package:flutter/material.dart';
import 'package:shinespy/component/bottombar.dart';


class LogInScreen extends StatelessWidget {
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
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 312.0, // Set width
                height: 43.0, // Set height
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email/ Phone Number',
                    filled: true,
                    fillColor: Color(0x679B9B9B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45), // Set border radius
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add space from the left
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 312.0, // Set width
                height: 43.0, // Set height
                child: TextField(
                  obscureText: true, // Hides the password
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0x679B9B9B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45), // Set border radius
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add space from the left
                    suffixIcon: Icon(Icons.lock, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 317.0,
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
                    'Log In',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF000000)),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add forgot password functionality here
                },
                child: Text('Forgot your password?',style:  TextStyle(color: Color(0xFFFFFFFF))),

              ),
              SizedBox(height: 10),
              Text('Or continue with',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
