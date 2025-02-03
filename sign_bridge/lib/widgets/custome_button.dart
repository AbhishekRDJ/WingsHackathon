import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final Color bgColor;
  final Color fgColor;
  final String text;
  final VoidCallback onPressed;
  final bool isBorder;

  const CustomeButton(
      {super.key,
      required this.bgColor,
      required this.text,
      required this.onPressed,
      required this.fgColor,
      this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(bgColor),
          padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: isBorder
                  ? BorderSide(color: Colors.black)
                  : BorderSide.none)),
          fixedSize: WidgetStatePropertyAll(Size(
              MediaQuery.of(context).size.width * 0.9,
              MediaQuery.of(context).size.height * 0.065)),
          elevation: WidgetStatePropertyAll(6)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: fgColor),
      ),
    );
  }
}
