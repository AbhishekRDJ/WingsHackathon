import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 225, 207, 1),
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 80),
                const SizedBox(height: 10),
                Icon(Icons.emoji_events, color: Colors.amber, size: 50),
                const SizedBox(height: 10),
                Text(
                  "Notification",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(notification["image"]!),
                    ),
                    title: Text(
                      notification["title"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      notification["description"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.grey[600]),
                    ),
                    trailing: Text(
                      notification["exp"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ).animate().fade(duration: 500.ms).slideX(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> notifications = [
  {
    "image": "assets/user1.png",
    "title": "Math Lecture 2.3",
    "description": "In the lessons we learn new words...",
    "exp": "3123 EXP"
  },
  {
    "image": "assets/user2.png",
    "title": "Essential Skill Lecture",
    "description": "In the lessons we learn new words...",
    "exp": "3123 EXP"
  },
  {
    "image": "assets/user3.png",
    "title": "New Feature Added",
    "description": "In the lessons we learn new words...",
    "exp": "3123 EXP"
  },
  {
    "image": "assets/user4.png",
    "title": "English New Lecture Add",
    "description": "In the lessons we learn new words...",
    "exp": "3123 EXP"
  },
  {
    "image": "assets/user5.png",
    "title": "Quize 3.0",
    "description": "In the lessons we learn new words...",
    "exp": "3123 EXP"
  },
  {
    "image": "assets/user6.png",
    "title": "Quiz 2.0",
    "description": "In the lessons we learn new words...",
    "exp": "3123 EXP"
  },
];
