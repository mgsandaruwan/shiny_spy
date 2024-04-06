import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shinespy/pages/termsandconditionpage.dart';

import '../popup_screen.dart';
import 'aboutUspage.dart';
import 'licensespage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(

        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.2), // Adjust the opacity value as needed
              borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
      ),
      // Adjust the radius as needed
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(
                Icons.contact_support, // Replace with the desired icon
                color: Colors.white,
              ),
              title: Text(
                "About Us",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
          ),
          SizedBox(height: 20,),

          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.2), // Adjust the opacity value as needed
              borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(
                Icons.info, // Replace with the desired icon
                color: Colors.white,
              ),
              title: Text(
                "App Version",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "1.0.0", // Replace with the actual app version
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Handle App Version action
              },
            ),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.2), // Adjust the opacity value as needed
              borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
            ),
            // Adjust the radius as needed
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(
                Icons.newspaper_outlined, // Replace with the desired icon
                color: Colors.white,
              ),
              title: Text(
                "Terms & Conditions",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsandConditionPage()),
                );
              },
            ),
          ),
          SizedBox(height: 120,),

          Divider(
            color: Colors.white, // Set the color of the line
            thickness: 1.0, // Set the thickness of the line
            height: 20, // Set the height of the line
            indent: 16, // Set the indentation of the line from the left
            endIndent: 16, // Set the indentation of the line from the right
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEFE8A2), // Adjust the opacity value as needed
              borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
            ),
            // Adjust the radius as needed
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 1), // Added vertical padding
              title: Center( // Centering the text
                child: Text(
                  "LogOut",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => popupscreen()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
