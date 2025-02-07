import 'package:flutter/material.dart';
import 'package:sign_bridge/pages/login_page.dart';
import 'package:sign_bridge/pages/signup_page.dart';
import 'package:sign_bridge/utils/colors.dart';
import 'package:sign_bridge/widgets/custome_button.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(0,
                  _animate ? -MediaQuery.of(context).size.height * 0.19 : 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeOut,
                    height: _animate ? 250 : 250, // Logo reaches max size first
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  const SizedBox(height: 30),
                  AnimatedOpacity(
                    duration: Duration(seconds: 2),
                    opacity: _animate ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            "Connecting",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            "through Signs !",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.18,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _animate ? 1 : 0,
              child: Column(
                children: [
                  CustomeButton(
                      bgColor: Colors.white,
                      fgColor: Colors.black,
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                      }),
                  const SizedBox(height: 20),
                  CustomeButton(
                    bgColor: bgColor,
                    fgColor: Colors.black,
                    text: "Log In",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    isBorder: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
