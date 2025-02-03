import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/learn/learning_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Hello User !",
                    style: Theme.of(context).textTheme.titleLarge),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIH3cVN9nVOwezMJZgjRo0YhASylFMo1nJpw&s"),
                )
              ]),
              const SizedBox(height: 16),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2, // Two columns
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final items = [
                      {
                        "title": "Learn",
                        "startColor": const Color(0xFFFFC107),
                        "endColor": Colors.orange,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LearningPage()));
                        } // Small card
                      },
                      {
                        "title": "Voice to Sign",
                        "startColor": Colors.pink,
                        "endColor": Colors.red,
                        "height": MediaQuery.of(context).size.height * 0.4,
                        'onTap': () {} // Big card
                      },
                      {
                        "title": "Text to Speech",
                        "startColor": Colors.deepPurple,
                        "endColor": Colors.purple,
                        "height": MediaQuery.of(context).size.height * 0.4,
                        'onTap': () {} // Small card
                      },
                      {
                        "title": "Sign to Voice",
                        "startColor": Colors.orangeAccent,
                        "endColor": Colors.deepOrange,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {} // Big card
                      },
                    ];
                    final item = items[index];
                    return _buildCard(
                        item["title"] as String,
                        item["startColor"] as Color,
                        item["endColor"] as Color,
                        item["height"] as double,
                        item['onTap'] as VoidCallback);
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
      double height, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
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
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
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
}
