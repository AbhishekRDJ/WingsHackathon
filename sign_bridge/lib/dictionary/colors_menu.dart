import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/dictionary/cards.dart';
import 'package:sign_bridge/widgets/custom_card.dart';

class ColorsMenu extends StatelessWidget {
  const ColorsMenu({super.key});

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
                  "Choose Color",
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
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      final items = [
                        {
                          "title": "Violet",
                          'cardColor': Color(0xFF9133FA),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Voilet",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/violet_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/violet.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/violet.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Blue",
                          'cardColor': Color(0xFF0F70D4),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Blue",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/blue_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/blue.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/blue.png?raw=true" // Small card
                        },
                        {
                          "title": "Green",
                          'cardColor': Color(0xFF1DD406),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Green",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/green_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/green.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/green.png?raw=true" // Small card
                        },
                        {
                          "title": "Yellow",
                          'cardColor': Color(0XFFD4BF00),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Yellow",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/yellow_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/yellow.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/yellow.png?raw=true" // Big card
                        },
                        {
                          "title": "Orange",
                          'cardColor': Color(0xFFFF8A00),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Orange",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/orange_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/orange.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/orange.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Red",
                          'cardColor': Color(0xFFD40F0F),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Red",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/red_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/red.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/red.png?raw=true" // Big card
                        },
                        {
                          "title": "Pink",
                          'cardColor': Color(0xFFFA33BD),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Pink",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/pink_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/pink.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/pink.png?raw=true" // Big card
                        },
                        {
                          "title": "White",
                          'cardColor': Colors.white,
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "White",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/white_spash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/white.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/white.png?raw=true" // Big card
                        },
                        {
                          "title": "Black",
                          'cardColor': Colors.black,
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Black",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_splash/black_splash.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colours_gifs/black.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colour_cards/black.png?raw=true" // Big card
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
