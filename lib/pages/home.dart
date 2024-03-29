import 'package:flutter/material.dart';
import 'package:shinespy/signup.dart'; // Adjust this import according to your project structure

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          child: contentBox(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: Colors.transparent, // Button background color
        child: Icon(Icons.headset_mic_outlined,color: Colors.white,), // Icon for the button (chat icon in this case)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Positioning the button at the bottom right
    );
  }

  Widget contentBox(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black, // Ensures the container's background is black
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  'Best Way to Find Your Skin Oiliness',
                  textAlign: TextAlign.center, // Centers the text
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Container(
                  width: 270,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Your oiliness level is',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                // TextField for inputting the level
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEFE8A2)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enter your level",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Level',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.number, // Assuming level is a number
                ),
                SizedBox(height: 30),
                Text(
                  'To get the detailed report',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    width: 317.0,
                    height: 56.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEFE8A2), // Button color
                      ),
                      child: Text(
                        'Check Report',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
