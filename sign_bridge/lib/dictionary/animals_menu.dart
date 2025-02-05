import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/dictionary/cards.dart';
import 'package:sign_bridge/widgets/custom_card.dart';

class AnimalsMenu extends StatelessWidget {
  const AnimalsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Animals",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MasonryGridView.count(
                    crossAxisCount: 2, // Two columns
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final items = [
                        {
                          "title": "Dog",
                          'cardColor': Color(0xFF543603),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Dog",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal/dog_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animals_gifs/dog.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal_cards/dog.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Cat",
                          'cardColor': Color(0xFF9F5905),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Cat",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal/cat_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animals_gifs/cat.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal_cards/cat.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Bird",
                          'cardColor': Color(0xFF2D225B),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Bird",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal/bird_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animals_gifs/bird.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal_cards/bird.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Fish",
                          'cardColor': Color(0XFF2D3D59),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Fish",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal/fish_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animals_gifs/fish.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animal_cards/fish.png?raw=true"
                          // Small card
                        },
                      ];
                      final item = items[index];
                      return CustomCard(
                        imgUrl: item['url'] as String,
                        title: item['title'] as String,
                        opTap: item['onTap'] as VoidCallback,
                        height: item['height'] as double,
                        color: item['cardColor'] as Color,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
