import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/dictionary/cards.dart';
import 'package:sign_bridge/widgets/custom_card.dart';

class GreetingsMenu extends StatelessWidget {
  const GreetingsMenu({super.key});

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
                  "Greetings",
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
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      final items = [
                        {
                          "title": "Hello",
                          'cardColor': Color(0xFF945809),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Hello",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/hello.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/hello.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/hello.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Byee",
                          'cardColor': Color(0xFFBD1A29),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Byee",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/goodbye.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/GoodBye.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/goodbye.png?raw=true" // Small card
                        },
                        {
                          "title": "Good morning",
                          'cardColor': Color(0xFFD8A92E),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Good morning",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/good_morning.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/GoodMorning.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/good_morning.png?raw=true" // Small card
                        },
                        {
                          "title": "Good Afternoon",
                          'cardColor': Color(0XFFF44020),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Good afternoon",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/good_afternoon.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/GoodAfternoon.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/good_evening.png?raw=true" // Big card
                        },
                        {
                          "title": "Good Night",
                          'cardColor': Color(0xFF3B2704),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Good night",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/good_night.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/goodnight.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/good_night.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "How are you ?",
                          'cardColor': Color(0xFF494949),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "How are you ?",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/how_are_you.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/how_are_you.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/how_are_you.png?raw=true" // Big card
                        },
                        {
                          "title": "All the best",
                          'cardColor': Color(0xFF071B4D),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "All the best",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/all_the_best.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/AllTheBest.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/all_the_best.png?raw=true" // Big card
                        },
                        {
                          "title": "Thank you",
                          'cardColor': Color(0xFF234938),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Thank you",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings/thank_you.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_gifs/thankyou.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings_cards/thank_you.png?raw=true" // Big card
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
