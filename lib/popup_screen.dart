import 'package:flutter/material.dart';
import"signup.dart";
class popupscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return SingleChildScrollView(
      child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                width: 294,
                height: 294,
                decoration: BoxDecoration(
                  color: Colors.grey, // You can change the color of the rectangle
                ),
                child: Icon(
                  Icons.camera_alt, // Camera icon
                  size: 100,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Your oiliness level is',
                style: TextStyle(fontSize: 16,color: Color(0xFFFFFFFF)),
              ),
              // TextField for inputting the level
              SizedBox(height: 40),
              Text(
                'To get the detailed report',
                style: TextStyle(fontSize: 16,color: Color(0xFFFFFFFF)),
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
                      'Log In',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]
      ),
    );
  }
}
