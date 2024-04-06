import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
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
              'Team Members',
              style: TextStyle(fontSize: 18, color: Colors.white), // Set text color to white
              textAlign: TextAlign.center, // Center align the text
            ),
            Divider( // Horizontal line
              color: Colors.white, // Set line color to white
              thickness: 2, // Set line thickness
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First member
                Column(
                  children: [
                    Image.asset(
                      'images/Kesara.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kesara Hansajith',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 30), // Add some space between the images
                // Second member
                Column(
                  children: [
                    Image.asset(
                      'images/basuru.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Basuru Yasaruwan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 30), // Add some space between the images
                // Second member

              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First member
                Column(
                  children: [
                    Image.asset(
                      'images/govindu.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Govindu Kamburugamuwa',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 30), // Add some space between the images
                // Second member
                Column(
                  children: [
                    Image.asset(
                      'images/tharindu.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tharindu Sandaruwan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 30), // Add some space between the images
                // Second member

              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First member
                Column(
                  children: [
                    Image.asset(
                      'images/thilina.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Thilina De Zoysa',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 30), // Add some space between the images
                // Second member
                Column(
                  children: [
                    Image.asset(
                      'images/dasuni.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Dasuni Paranavithana',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 30), // Add some space between the images

                // Second member
              ],
            ),
            SizedBox(height: 30,),
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
