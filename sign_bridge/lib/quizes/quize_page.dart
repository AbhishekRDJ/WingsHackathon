import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sign_bridge/quizes/quiz.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
                    "User Name",
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
                    return _buildCard(
                            item["title"] as String,
                            item["startColor"] as Color,
                            item["endColor"] as Color,
                            item['context'] as BuildContext,
                            item["height"] as double,
                            item['onTap'] as VoidCallback,
                            item['url'] as String)
                        .animate()
                        .moveX(
                          begin: index % 2 == 0 ? -200 : 200,
                          end: 0,
                          duration: 600.ms,
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

  Widget _buildCard(String title, Color startColor, Color endColor,
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
          top: 10,
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
