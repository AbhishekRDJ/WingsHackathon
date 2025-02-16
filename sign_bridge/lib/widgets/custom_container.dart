import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imgUrl;
  final Color? bgColor;
  final String title;
  final double height;
  final VoidCallback onTap;

  const CustomContainer(
      {super.key,
      this.bgColor,
      required this.height,
      required this.imgUrl,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(10),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        height: height,
        width: MediaQuery.of(context).size.width * 0.42,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
