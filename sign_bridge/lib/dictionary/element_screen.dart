import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/utils/colors.dart';
import 'package:sign_bridge/utils/data.dart';

class ElementScreen extends StatefulWidget {
  const ElementScreen({super.key});

  @override
  State<ElementScreen> createState() => _ElementScreenState();
}

List<int> buildIndex() {
  List<int> indices = [];
  for (int i = 0; i < alphabets.length; i++) {
    indices.add(i);
  }
  return indices;
}

class _ElementScreenState extends State<ElementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 70, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Alphabets',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 400,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                autoPlay: false,
                autoPlayInterval: Duration(
                  seconds: 3,
                ),
              ),
              items: buildIndex().map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            alphabets[i],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
