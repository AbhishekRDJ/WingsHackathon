import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sign_bridge/quizes/quiz.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/utils/card_building.dart';
import 'package:sign_bridge/utils/data.dart';

class HomePageOfQuize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A148C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 32,
                      )),
                  Text(
                    "Quizzes and Games",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ).animate().slide(),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final items = [
                      {
                        "title": "Alphabets",
                        "startColor": const Color(0xFFFFC107),
                        "endColor": Colors.orange,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => QuizPage(
                                    questions: greetings,
                                    isAsset: false,
                                  )));
                        },
                        'url':
                            "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/quizzes/alphabets_quiz.png?raw=true"
                      },
                      {
                        "title": "Greeting",
                        "startColor": const Color(0xFFFFC107),
                        "endColor": Colors.orange,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => QuizPage(
                                    questions: quizes,
                                    isAsset: true,
                                  )));
                        },
                        'url':
                            "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/quizzes/greetings_quiz.png?raw=true"
                      },
                      {
                        "title": "Challenge",
                        "startColor": const Color(0xFFFFC107),
                        "endColor": Colors.orange,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => QuizPage(
                                    questions: challenges,
                                    isAsset: true,
                                  )));
                        },
                        'url':
                            "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/quizzes/challenge_quiz.png?raw=true"
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
            ],
          ),
        ),
      ),
    );
  }
}
