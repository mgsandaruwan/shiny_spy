import 'package:flutter/material.dart';
import 'package:shinespy/popup_screen.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'images/Vector.png',
              width: 350.0,
              height: 550.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Check your oiliness',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Discover the perfect skincare for you!',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20), // Add space between the text and button
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  width: 317.0,
                  height: 56.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PopupScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEFE8A2), // Button color
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}