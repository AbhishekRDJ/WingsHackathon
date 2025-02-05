import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/dictionary/cards.dart';
import 'package:sign_bridge/widgets/custom_card.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

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
                  "Food Items",
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
                          "title": "Water",
                          'cardColor': Color(0xFF304C82),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Water",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/water_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/Water.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/water.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Apple",
                          'cardColor': Color(0xFFAF4747),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Apple",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/apple_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/apple.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/apple.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Banana",
                          'cardColor': Color(0xFF866100),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Banana",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/banana_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/Banana.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/banana.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Milk",
                          'cardColor': Color(0XFF0069A8),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Milk",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/milk_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/milk.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/milk.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Samosa",
                          'cardColor': Color(0xFF304C82),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Samosa",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/samosa_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/samosa.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/samosa.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Ice Cream",
                          'cardColor': Color(0xFF304C82),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Ice Cream",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/icecream_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/Icecream.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/icecream.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Bread",
                          'cardColor': Color(0xFF304C82),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Bread",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/bread_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/bread.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/bread.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Cake",
                          'cardColor': Color(0xFF304C82),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Cake",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food/cake_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_gifs/cake.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/food_cards/cake.png?raw=true"
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
