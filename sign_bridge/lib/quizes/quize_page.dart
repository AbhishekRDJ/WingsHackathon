// import "package:flutter/material.dart";

// class QuizePage extends StatelessWidget {
//   const QuizePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Quizes"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sign_bridge/quizes/quiz.dart';

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
              SizedBox(height: 10),
              Text(
                "Good Morning",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ).animate().fade(duration: 500.ms),
              SizedBox(height: 5),
              Text(
                "User Name",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ).animate().slide(),
              SizedBox(height: 20),
              _recentQuizCard().animate().scale(duration: 700.ms),
              SizedBox(height: 20),
              _buildCard(context, "Quizzes", Icons.quiz, Colors.purpleAccent,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              }).animate().moveX(begin: -200, end: 0, duration: 600.ms),
              SizedBox(height: 15),
              _buildCard(context, "Games", Icons.videogame_asset,
                      Colors.blueAccent, () {})
                  .animate()
                  .moveX(begin: 200, end: 0, duration: 600.ms),
              SizedBox(height: 15),
              _buildCard(context, "Leaderboard", Icons.leaderboard, Colors.teal,
                      () {})
                  .animate()
                  .scale(duration: 500.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentQuizCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Colors.pinkAccent, Colors.deepOrange]),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Quiz",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                "A Basic Music Quiz",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text("65%",
                style: TextStyle(
                    color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
