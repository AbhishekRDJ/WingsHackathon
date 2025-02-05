import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final VoidCallback opTap;
  final double height;

  final String imgUrl;
  final String title;
  final Color? color;
  final Color? cardColor;

  const CustomCard(
      {super.key,
      required this.height,
      required this.imgUrl,
      required this.opTap,
      required this.title,
      this.color,
      this.cardColor});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.opTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.height, // Dynamic height per card
        decoration: BoxDecoration(
            color: widget.cardColor ?? null,
            borderRadius: BorderRadius.circular(16),
            image: widget.cardColor == null
                ? DecorationImage(image: NetworkImage(widget.imgUrl))
                : null),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: widget.color ?? Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
