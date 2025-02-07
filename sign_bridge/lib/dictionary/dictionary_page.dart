import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/dictionary/animals_menu.dart';
import 'package:sign_bridge/dictionary/colors_menu.dart';
import 'package:sign_bridge/dictionary/days_months_menu.dart';
import 'package:sign_bridge/dictionary/elements_page.dart';
import 'package:sign_bridge/dictionary/emotion_menu.dart';
import 'package:sign_bridge/dictionary/family_menu.dart';
import 'package:sign_bridge/dictionary/food_menu.dart';
import 'package:sign_bridge/dictionary/greetings_menu.dart';
import 'package:sign_bridge/utils/data.dart';
import 'package:sign_bridge/widgets/custom_card.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

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
              Text(
                "Dictioanry",
                style: Theme.of(context).textTheme.titleLarge,
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
                          "title": "Alphabets",

                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ElementScreen(
                                      ls: alphabets,
                                      title: "Alphabets",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/alphabet.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Numbers",

                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ElementScreen(
                                    ls: numbers, title: 'Numbers')));
                          },
                          'url':
                              'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/numbers.png?raw=true' // Small card
                        },
                        {
                          "title": "Days & Months",

                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DaysMonthsMenu()));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/calendar.png?raw=true" // Small card
                        },
                        {
                          "title": "Colors",

                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ColorsMenu()));
                          },
                          'url':
                              'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/colors.png?raw=true' // Big card
                        },
                        {
                          "title": "Family",

                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FamilyMenu()));
                          },
                          'url':
                              'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family.png?raw=true' // Small card
                        },
                        {
                          "title": "Greetings",

                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GreetingsMenu()));
                          },
                          'url':
                              'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/greetings.png?raw=true' // Big card
                        },
                        {
                          "title": "Food",

                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodMenu()));
                          },
                          'url':
                              'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food.png?raw=true' // Big card
                        },
                        {
                          "title": "Animals",
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AnimalsMenu()));
                          },
                          'url':
                              'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/animals.png?raw=true' // Big card
                        },
                        {
                          "title": "Emotions",
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EmotionMenu()));
                          },
                          'url':
                              'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/emotions.png?raw=true' // Big card
                        },
                      ];
                      final item = items[index];
                      return CustomCard(
                        imgUrl: item['url'] as String,
                        title: item['title'] as String,
                        opTap: item['onTap'] as VoidCallback,
                        height: item['height'] as double,
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
