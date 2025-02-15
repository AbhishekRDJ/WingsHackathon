import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final ConfettiController _confettiController =
      ConfettiController(duration: Duration(seconds: 3));

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What is the capital of France?",
      "options": ["Paris", "London", "Berlin", "Madrid"],
      "answer": "Paris"
    },
    {
      "question": "Who wrote 'To Kill a Mockingbird'?",
      "options": [
        "Harper Lee",
        "J.K. Rowling",
        "Ernest Hemingway",
        "Mark Twain"
      ],
      "answer": "Harper Lee"
    },
    {
      "question": "What is the square root of 64?",
      "options": ["6", "8", "10", "12"],
      "answer": "8"
    },
    {
      "question": "What is the largest planet in our solar system?",
      "options": ["Earth", "Jupiter", "Mars", "Saturn"],
      "answer": "Jupiter"
    },
    {
      "question": "What year did World War II end?",
      "options": ["1945", "1939", "1918", "1965"],
      "answer": "1945"
    },
    {
      "question": "What is the chemical symbol for Gold?",
      "options": ["Au", "Ag", "Pb", "Fe"],
      "answer": "Au"
    },
    {
      "question": "What is the powerhouse of the cell?",
      "options": ["Nucleus", "Mitochondria", "Ribosome", "Golgi body"],
      "answer": "Mitochondria"
    }
  ];

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]["answer"]) {
      _score++;
    }
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        if (_score == _questions.length) {
          _confettiController.play();
        }
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Quiz Completed!"),
        content: Text("Your Score: $_score/${_questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _currentQuestionIndex = 0;
                _score = 0;
              });
              Navigator.pop(context);
            },
            child: Text("Restart"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Quiz Level 3"), backgroundColor: Colors.deepPurple),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Question ${_currentQuestionIndex + 1} of ${_questions.length}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(height: 10),
                FadeIn(
                  child: Text(
                    _questions[_currentQuestionIndex]["question"],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: _questions[_currentQuestionIndex]["options"]
                      .map<Widget>((option) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: BounceInLeft(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () => _checkAnswer(option),
                          child: Text(option, style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
