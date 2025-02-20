import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  final bool isAsset;

  const QuizPage({super.key, required this.questions, required this.isAsset});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;
  bool answerSelected = false;
  Map<String, Color> buttonColors = {};
  Timer? timer;
  int timeLeft = 10;

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
    _startTimer();
  }

  void _shuffleQuestions() {
    setState(() {
      widget.questions.shuffle(Random());
      for (var question in widget.questions) {
        (question["options"] as List).shuffle();
      }
    });
  }

  void _startTimer() {
    timer?.cancel();
    timeLeft = 10;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        _nextQuestion();
      }
    });
  }

  void _checkAnswer(String selectedOption) {
    if (answerSelected) return;

    setState(() {
      answerSelected = true;
      String correctAnswer = widget.questions[questionIndex]["answer"];

      if (selectedOption == correctAnswer) {
        score++;
        buttonColors[selectedOption] = Colors.green;
      } else {
        buttonColors[selectedOption] = Colors.red;
        buttonColors[correctAnswer] = Colors.green;
      }
    });

    Future.delayed(Duration(seconds: 1), _nextQuestion);
  }

  void _nextQuestion() {
    if (questionIndex < widget.questions.length - 1) {
      setState(() {
        questionIndex++;
        answerSelected = false;
        buttonColors.clear();
      });
      _startTimer();
    } else {
      _showFinalScore();
    }
  }

  void _restartQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
      answerSelected = false;
      buttonColors.clear();
      _shuffleQuestions();
    });
    _startTimer();
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text("Quiz Completed!"),
        content: Text("Your score: $score / ${widget.questions.length}"),
        actions: [
          TextButton(
            child: Text("Restart"),
            onPressed: () {
              Navigator.of(ctx).pop();
              _restartQuiz();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A148C),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Guess the alphabet",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  "${questionIndex + 1}/${widget.questions.length}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Time left: $timeLeft sec",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 20),
                widget.isAsset
                    ? Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              widget.questions[questionIndex]["image"],
                              fit: BoxFit.fill,
                            )),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              widget.questions[questionIndex]["image"],
                              fit: BoxFit.fill,
                            )),
                      ),
                SizedBox(height: 20),
                Column(
                  children: (widget.questions[questionIndex]["options"]
                          as List<String>)
                      .map((option) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    buttonColors[option] ?? Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(65)),
                                fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.9,
                                  MediaQuery.of(context).size.height * 0.045,
                                ),
                              ),
                              onPressed: () => _checkAnswer(option),
                              child: Text(
                                option,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
