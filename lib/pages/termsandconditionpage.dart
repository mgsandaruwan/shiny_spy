import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsandConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Condition',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Set font weight to bold
          ),
        ),
        centerTitle: true, // Center align the title text
        backgroundColor: Colors.black, // Set app bar color to black
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center align the content
          children: [
            SizedBox(height: 20),
            Text(
              'Terms & Condition',
              style: TextStyle(fontSize: 18, color: Colors.white), // Set text color to white
              textAlign: TextAlign.center, // Center align the text
            ),
            Divider( // Horizontal line
              color: Colors.white, // Set line color to white
              thickness: 2, // Set line thickness
            ),
            SizedBox(height: 20),
            // Include the terms and conditions text below the divider
            Text(
              "By downloading, installing, or using the ShineSpy App, you agree to abide by these terms and conditions. If you do not agree with any part of these terms, you may not use the app.\n\n"
                  "The ShineSpy App provides users with a tool to assess facial oiliness using a smartphone camera. The app may provide recommendations based on the assessment but does not guarantee the accuracy of the results.\n\n"
                  "The app is intended for informational purposes only and may not always provide accurate assessments of facial oiliness. Users should consult a skincare professional for personalized advice.\n\n"
                  "You agree not to use the app for any unlawful purposes or in any way that could damage, disable, overburden, or impair the app.\n\n"
                  "Our privacy policy outlines how we collect, use, and protect user data. By using the app, you consent to the collection and use of your data as described in the privacy policy.\n\n"
                  "We take appropriate measures to protect user data from unauthorized access or disclosure. However, we cannot guarantee the security of user data.\n\n"
                  "All content, trademarks, and copyrights in the app are owned by us or our licensors.\n\n"
                  "We are not liable for any damages or losses incurred by users while using the app, including but not limited to direct, indirect, incidental, or consequential damages.\n\n"
                  "We reserve the right to terminate a user's access to the app for any reason at any time.\n\n"
                  "We reserve the right to update or change these terms and conditions at any time. Any changes will be effective immediately upon posting.\n\n"
                  "If you have any questions or concerns about these terms and conditions, please contact us at ",
              style: TextStyle(color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                _launchEmail();
              },
              child: Text(
                "shinespy@gmail.com",
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch email intent
  void _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'shinespy@gmail.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
