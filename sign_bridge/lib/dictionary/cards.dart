import 'package:flutter/material.dart';
import 'package:sign_bridge/utils/colors.dart';

class Cards extends StatelessWidget {
  final String image;
  final String gif;
  final String title;

  const Cards(
      {super.key, required this.gif, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 20.0,
                ),
                Image.network(
                  image,
                  height: 200,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Image.network(
                  gif,
                  height: 400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
