import 'dart:ui';
import 'package:flutter/material.dart';

class CardBuilder {
  static Widget buildCard(String title, Color startColor, Color endColor,
      BuildContext context, double height, VoidCallback onTap, String imgUrl) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: height, // Dynamic height per card
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: endColor.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Opacity(
            opacity: 1,
            child: imgUrl == ''
                ? SizedBox(
                    width: height,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        Positioned(
          top: 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white)
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
