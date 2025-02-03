import 'package:flutter/material.dart';

class TutorialsPage extends StatelessWidget {
  const TutorialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Tutorials"),
      ),
      body: Center(
        child: Text(
          "Tutorials Page Content",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
