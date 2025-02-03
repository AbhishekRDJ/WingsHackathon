import 'package:flutter/material.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Dictionary"),
        leading: Text(""),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Dictionary Page Content",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
