import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          "Settings Page",
          style: TextStyle(color: Colors.white), // Changing font color to white
        ),
      ),
    );
  }
}
