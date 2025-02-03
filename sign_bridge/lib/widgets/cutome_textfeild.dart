import 'package:flutter/material.dart';

class CustomeTextfeild extends StatelessWidget {
  final String hintText;
  final bool isPass;
  final TextEditingController controller;

  const CustomeTextfeild(
      {super.key,
      required this.hintText,
      required this.isPass,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      style:
          Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        label: Text(hintText),
        labelStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(244, 242, 240, 240)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(244, 242, 240, 240)),
        ),
      ),
    );
  }
}
