import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DoAndDont extends StatelessWidget {
  const DoAndDont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A148C),
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Do & Don’t Guidelines',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnimatedHeaderCard(),
            _buildGuidelineTile(
              icon: Icons.check_circle,
              color: Colors.green,
              title: 'Do',
              items: [
                'Use sign language to communicate effectively.',
                'Be patient while interacting with deaf individuals.',
                'Encourage the use of text-to-speech apps.',
                'Use gestures and expressions for better understanding.',
              ],
            ),
            _buildGuidelineTile(
              icon: Icons.cancel,
              color: Colors.red,
              title: 'Don’t',
              items: [
                'Ignore or avoid eye contact when communicating.',
                'Speak too fast without giving time to read lips.',
                'Assume all deaf individuals can lip-read.',
                'Use complicated words in written communication.',
              ],
            ),
            _buildAnimatedCard(
                'Learn Basic Sign Language', Icons.school, Colors.blueAccent),
            _buildAnimatedCard('Use Visual Cues & Gestures', Icons.visibility,
                Colors.orangeAccent),
            _buildAnimatedCard(
                'Be Inclusive & Supportive', Icons.group, Colors.greenAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildGuidelineTile({
    required IconData icon,
    required Color color,
    required String title,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(icon, color: color, size: 32),
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map((item) => Text(
                        '- $item',
                        style: const TextStyle(fontSize: 16),
                      ))
                  .toList(),
            ),
          ),
        ).animate().fade(duration: 600.ms).slideX(begin: 0.5, end: 0.0),
      ),
    );
  }

  Widget _buildAnimatedCard(String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: Colors.white, size: 36),
          ],
        ),
      ).animate().fade(duration: 600.ms).scale(delay: 400.ms),
    );
  }
}

class AnimatedHeaderCard extends StatelessWidget {
  const AnimatedHeaderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello User...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Explore Guidelines',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.handshake,
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    ).animate().fade(duration: 800.ms).scale();
  }
}
