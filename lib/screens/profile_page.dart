import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Профил")),
      body: Center(
        child: Text(
          "Профил (версияи аввал)",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
