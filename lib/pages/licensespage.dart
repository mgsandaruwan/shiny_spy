import 'package:flutter/material.dart';

class LicensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Licenses',
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
              'Licenses',
              style: TextStyle(fontSize: 18, color: Colors.white), // Set text color to white
              textAlign: TextAlign.center, // Center align the text
            ),
            Divider( // Horizontal line
              color: Colors.white, // Set line color to white
              thickness: 2, // Set line thickness
            ),
          ],
        ),
      ),
    );
  }
}
