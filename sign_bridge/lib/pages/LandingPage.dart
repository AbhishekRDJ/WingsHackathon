import 'package:flutter/material.dart';
import 'package:sign_bridge/pages/dictionary_page.dart';
import 'package:sign_bridge/pages/profile_page.dart.dart';
import 'package:sign_bridge/pages/tutorial_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: [
            Text(
              "Hello, User!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "RECOMMENDED",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 4, // Adjusts card height dynamically
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final items = [
                    {
                      "title": "Learn",
                      "startColor": const Color(0xFFFFC107),
                      "endColor": Colors.orange,
                      "heightFactor": 1.0
                    },
                    {
                      "title": "Voice to Sign",
                      "startColor": Colors.pink,
                      "endColor": Colors.red,
                      "heightFactor": 1.2
                    },
                    {
                      "title": "Text to Speech",
                      "startColor": Colors.deepPurple,
                      "endColor": Colors.purple,
                      "heightFactor": 0.9
                    },
                    {
                      "title": "Sign to Voice",
                      "startColor": Colors.orangeAccent,
                      "endColor": Colors.deepOrange,
                      "heightFactor": 1.3
                    },
                  ];
                  final item = items[index];
                  return _buildCard(
                    item["title"] as String,
                    item["startColor"] as Color,
                    item["endColor"] as Color,
                    item["heightFactor"] as double,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildCard(
      String title, Color startColor, Color endColor, double heightFactor) {
    return GestureDetector(
      onTap: () {
        // Add functionality for each card tap
        print('$title tapped');
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 200 * heightFactor, // Dynamic height
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
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            // Already on Discover
            break;
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TutorialsPage()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DictionaryPage()));
            break;
          case 3:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvancedProfilePage()));
            break;
        }
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
    );
  }
}
