import 'package:flutter/material.dart';
import 'package:sign_bridge/learn/acdamics_page.dart';

import 'package:sign_bridge/widgets/custom_container.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(children: [
            Text(
              "Learning",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomContainer(
                  height: MediaQuery.of(context).size.height * 0.32,
                  imgUrl:
                      'https://i.pinimg.com/236x/82/75/ea/8275ea5e8c59e1f95401a6bd72566d41.jpg',
                  title: "Acdamics",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AcdamicsPage()));
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomContainer(
                  height: MediaQuery.of(context).size.height * 0.32,
                  imgUrl:
                      'https://i.pinimg.com/736x/d4/69/de/d469def425bf34ed9c64eef7c6d83210.jpg',
                  title: "Essential skills",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomContainer(
                height: MediaQuery.of(context).size.height * 0.32,
                imgUrl:
                    'https://i.pinimg.com/236x/14/fe/92/14fe92a1a7246a8056de5ed6c7de653b.jpg',
                title: "Do's and Don'ts",
                onTap: () {},
              ),
            )
          ]),
        ),
      ),
    );
  }
}
