import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sign_bridge/dictionary/cards.dart';
import 'package:sign_bridge/widgets/custom_card.dart';

class FamilyMenu extends StatelessWidget {
  const FamilyMenu({super.key});

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
                  "Family",
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
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final items = [
                        {
                          "title": "Mother",
                          'cardColor': Color(0xFFD14C64),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Mother",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family/mother_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_gifs/mother.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_cards/mother.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Father",
                          'cardColor': Color(0xFFB89427),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Father",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family/father_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_gifs/father.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_cards/father.png?raw=true" // Small card
                        },
                        {
                          "title": "Sister",
                          'cardColor': Color(0xFF721548),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Sister",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family/sister_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_gifs/sister.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_cards/sister.png?raw=true" // Small card
                        },
                        {
                          "title": "Brother",
                          'cardColor': Color(0XFF645982),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Brother",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family/brother_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_gifs/brother.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_cards/brother.png?raw=true" // Big card
                        },
                        {
                          "title": "Grandma",
                          'cardColor': Color(0xFF847642),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Grandma",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family/grandmother_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_gifs/grandmother.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_cards/grandmother.png?raw=true"
                          // Small card
                        },
                        {
                          "title": "Grandpa",
                          'cardColor': Color(0xFF494949),
                          'context': context,
                          "height": MediaQuery.of(context).size.height * 0.2,
                          'onTap': () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cards(
                                      title: "Grandpa",
                                      image:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family/grandfather_page.png?raw=true",
                                      gif:
                                          "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_gifs/grandfather.gif?raw=true",
                                    )));
                          },
                          'url':
                              "https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/family_cards/grandfather.png?raw=true" // Big card
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
