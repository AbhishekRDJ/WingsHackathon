import 'package:flutter/material.dart';

class TutorialsPage extends StatelessWidget {
  const TutorialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Tutorials"),
        leading: Text(""),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Tutorials Page Content",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
