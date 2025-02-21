import 'package:flutter/material.dart';
import 'package:sign_bridge/learn/playlist.dart';
import 'package:sign_bridge/utils/data.dart';

class AcdamicsPage extends StatefulWidget {
  const AcdamicsPage({super.key});

  @override
  State<AcdamicsPage> createState() => _AcdamicsPageState();
}

class _AcdamicsPageState extends State<AcdamicsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Image.asset('assets/images/logo2.png'),
                    Text(
                      "Hello User ... ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.redAccent),
                    ),
                    Text(
                      "Welcome to acdamics",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.035,
                    right: 10,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIH3cVN9nVOwezMJZgjRo0YhASylFMo1nJpw&s"),
                    ))
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.030,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: subjects.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint(subjects[index]['imgUrl']);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CoursePage(
                                    playlistUrl: subjects[index]['play'],
                                    title: subjects[index]['subject'],
                                  )));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 23, 36, 65),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(subjects[index]['imgUrl']),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subjects[index]['subject'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    subjects[index]['progress'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
