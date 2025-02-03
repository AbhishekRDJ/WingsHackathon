import 'package:flutter/material.dart';
import 'package:sign_bridge/pages/DictionaryPage.dart';
import 'package:sign_bridge/pages/LandingPage.dart';
import 'package:sign_bridge/pages/ProfilePage.dart';
import 'package:sign_bridge/pages/TutorialsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    LandingPage(),
    TutorialsPage(),
    DictionaryPage(),
    AdvancedProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index to navigate
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Tutorials',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
