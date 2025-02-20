import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/dictionary/dictionary_page.dart';
import 'package:sign_bridge/learn/learning_page.dart';
import 'package:sign_bridge/quizes/quize_page.dart';
import 'package:sign_bridge/text_to_speech/tts_page.dart';
import 'package:sign_bridge/voice_to_sign/voice_to_sign_homeScreen.dart';

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
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final items = [
                      {
                        "title": "Learn",
                        "startColor": const Color(0xFFFFC107),
                        "endColor": Colors.orange,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LearningPage()));
                        },
                        'url':
                            "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/learn.jpg?raw=true"
                        // Small card
                      },
                      {
                        "title": "Dictionary",
                        "startColor": const Color(0xFFFFC107),
                        "endColor": Colors.orange,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.38,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DictionaryPage()));
                        },
                        'url':
                            'https://i.pinimg.com/736x/26/74/b6/2674b6e19c35834b1135e8e8c3fec5e8.jpg' // Small card
                      },
                      {
                        "title": "Quizes & Games",
                        "startColor": const Color(0xFFFFC107),
                        "endColor": Colors.orange,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.38,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePageOfQuize()));
                        },
                        'url':
                            "https://i.pinimg.com/736x/d8/e9/0c/d8e90c3c26cb75336b3d51e7739082a1.jpg" // Small card
                      },
                      {
                        "title": "Voice to Sign",
                        "startColor": Colors.pink,
                        "endColor": Colors.red,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreenOfVTS()));
                        },
                        'url':
                            'https://i.pinimg.com/736x/72/23/ad/7223add877ddb9dfdf2593fec35f1e4f.jpg' // Big card
                      },
                      {
                        "title": "Text to Speech",
                        "startColor": Colors.deepPurple,
                        "endColor": Colors.purple,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TTSPage()));
                        },
                        'url':
                            'https://i.pinimg.com/474x/2e/fb/80/2efb805dd22b7349aeae1abdc5a81443.jpg' // Small card
                      },
                      {
                        "title": "Sign to Voice",
                        "startColor": Colors.orangeAccent,
                        "endColor": Colors.deepOrange,
                        'context': context,
                        "height": MediaQuery.of(context).size.height * 0.3,
                        'onTap': () {},
                        'url':
                            'https://i.pinimg.com/736x/5f/96/0b/5f960b8b585158f982e7e2d66f36f005.jpg' // Big card
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
                        item['url'] as String);
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
        Padding(
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
      ]),
    );
  }
}
