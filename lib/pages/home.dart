import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:shinespy/pages/tensorflow.dart';
import 'package:shinespy/pdf.dart';

import 'package:shinespy/signUpscreen.dart';
import 'package:shinespy/chatbot.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController levelController = TextEditingController(); // Controller for the TextField

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          child: contentBox(context, levelController), // Pass the controller to the contentBox function
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Chatbot()),
            );
          },
        backgroundColor: Color(0xFFFBC02D), // Button background color
        child: Icon(Icons.three_p, color: Colors.black), // Icon for the button (chat icon in this case)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Positioning the button at the bottom right
    );
  }

  Widget contentBox(BuildContext context, TextEditingController levelController) {
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
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async{
                    // Navigate to LiveSkin Oilyness detecttion Face Cam
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LiveSkinDetection()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEFE8A2), // Button color
                  ),
                  child: Text(
                    'Open Camera',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF000000)),
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
                  controller: levelController, // Assign the controller
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
                    width: 312.0,
                    height: 56.0,
                    child: ElevatedButton(
                      onPressed: () {
                        String? userUid = FirebaseAuth.instance.currentUser?.uid;
                        if (userUid != null) {
                          String docid = userUid; // Assuming useruid is defined somewhere
                          // Store the level in Firestore
                          FirebaseFirestore.instance.collection('oillevel').doc(docid).set({
                            'level': int.parse(levelController.text), // Assuming level is stored as an integer
                            'timestamp': DateTime.now(), // Adding current date and time
                          }).then((_) {
                            //Navigate to the next screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PdfGenerater(
                                docId: docid,
                                level: int.parse(levelController.text),
                                timestamp: DateTime.now(),)),
                            );
                          }).catchError((error) {
                            // Handle errors if any
                            print("Error adding level: $error");
                          });
                        } else {
                          // Handle the case when there is no signed-in user
                          print("Error: No signed-in user.");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEFE8A2), // Button color
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
