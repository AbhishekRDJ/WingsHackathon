import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sign_bridge/pages/signup_page.dart';
import 'package:sign_bridge/screens/home_screen.dart';
import 'package:sign_bridge/widgets/custome_button.dart';
import 'package:sign_bridge/widgets/cutome_textfeild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/logo2.png"),
            ),
          ),
          const SizedBox(height: 5),
          Text("Welcome back! Let’s bridge the gap.",
                  style: Theme.of(context).textTheme.titleLarge)
              .animate()
              .slideX(
                  delay: Duration(milliseconds: 300),
                  duration: Duration(seconds: 1))
              .fade(delay: Duration(milliseconds: 400)),
          const SizedBox(height: 30),
          CustomeTextfeild(
            hintText: "Enter your email",
            isPass: false,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          CustomeTextfeild(
            hintText: "Enter your password",
            isPass: false,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 50),
          Center(
            child: CustomeButton(
              bgColor: Colors.black,
              text: "Log In",
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              fgColor: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: RichText(
                  text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.normal, color: Colors.black87),
                      children: [
                    TextSpan(
                        text: "Sign Up",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                            decoration: TextDecoration.underline))
                  ])),
            ),
          )
        ]),
      ),
    );
  }
}
