import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sign_bridge/widgets/custome_button.dart';
import 'package:sign_bridge/widgets/cutome_textfeild.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/logo2.png"),
            ),
          ),
          const SizedBox(height: 5),
          Text("Join us and start bridging worlds today!",
                  style: Theme.of(context).textTheme.titleLarge)
              .animate()
              .slideX(
                  delay: Duration(milliseconds: 300),
                  duration: Duration(seconds: 1))
              .fade(delay: Duration(milliseconds: 400)),
          const SizedBox(height: 30),
          CustomeTextfeild(
            hintText: "Enter your name",
            isPass: false,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          CustomeTextfeild(
            hintText: "Enter your email",
            isPass: false,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          CustomeTextfeild(
            hintText: "Enter your password",
            isPass: true,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          CustomeTextfeild(
            hintText: "Confirm your password",
            isPass: true,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 50),
          Center(
            child: CustomeButton(
              bgColor: Colors.black,
              text: "Create account",
              onPressed: () {},
              fgColor: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
                text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.black87),
                    children: [
                  TextSpan(
                      text: "Log in",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          decoration: TextDecoration.underline))
                ])),
          )
        ]),
      ),
    );
  }
}
