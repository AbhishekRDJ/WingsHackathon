import 'package:flutter/material.dart';
import 'package:sign_bridge/dictionary/elements_page.dart';
import 'package:sign_bridge/utils/colors.dart';
import 'package:sign_bridge/utils/data.dart';

class DaysMonthsMenu extends StatelessWidget {
  const DaysMonthsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Days and Months',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ElementScreen(ls: days, title: "Days")));
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.network(
                      'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/days.png?raw=true',
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 120,
                    child: Text(
                      'Days',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D3D2A),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ElementScreen(ls: months, title: "Months")));
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.network(
                      'https://github.com/srishtiv27/give_me_a_sign/blob/main/assets/images/months.png?raw=true',
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 110,
                    child: Text(
                      'Months',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D3D2A),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
