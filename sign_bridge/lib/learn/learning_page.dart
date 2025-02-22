import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/learn/acdamics_page.dart';
import 'package:sign_bridge/learn/do_and_don\'t.dart';

import 'package:sign_bridge/utils/card_building.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A148C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(children: [
            Text(
              "Learning",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
            ),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final items = [
                    {
                      "title": "Acadmics",
                      "startColor": const Color(0xFFFFC107),
                      "endColor": Colors.orange,
                      'context': context,
                      "height": MediaQuery.of(context).size.height * 0.3,
                      'onTap': () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AcdamicsPage()));
                      },
                      'url':
                          'https://i.pinimg.com/236x/82/75/ea/8275ea5e8c59e1f95401a6bd72566d41.jpg'
                    },
                    {
                      "title": "Essential\nskills",
                      "startColor": const Color(0xFFFFC107),
                      "endColor": Colors.orange,
                      'context': context,
                      "height": MediaQuery.of(context).size.height * 0.3,
                      'onTap': () {},
                      'url':
                          'https://i.pinimg.com/736x/d4/69/de/d469def425bf34ed9c64eef7c6d83210.jpg'
                    },
                    {
                      "title": "Do's and \nDon'ts",
                      "startColor": const Color(0xFFFFC107),
                      "endColor": Colors.orange,
                      'context': context,
                      "height": MediaQuery.of(context).size.height * 0.3,
                      'onTap': () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DoAndDont()));
                      },
                      'url':
                          'https://i.pinimg.com/236x/14/fe/92/14fe92a1a7246a8056de5ed6c7de653b.jpg'
                    },
                  ];
                  final item = items[index];
                  return CardBuilder.buildCard(
                          item["title"] as String,
                          item["startColor"] as Color,
                          item["endColor"] as Color,
                          item['context'] as BuildContext,
                          item["height"] as double,
                          item['onTap'] as VoidCallback,
                          item['url'] as String)
                      .animate()
                      .scale(
                        begin: Offset.zero,
                        end: Offset(1, 1),
                        duration: 600.ms,
                        delay: (index * 200).ms,
                      );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
