import 'package:flutter/material.dart';
import 'package:sign_bridge/mainscreen/mainscreen.dart';
import 'package:sign_bridge/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: bgColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
              .copyWith(fontFamily: 'poppins'),
          bodyMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              .copyWith(fontFamily: 'poppins'),
          bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              .copyWith(fontFamily: 'poppins'),
          titleLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)
              .copyWith(fontFamily: 'poppins'),
          titleMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
              .copyWith(fontFamily: 'poppins'),
          titleSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              .copyWith(fontFamily: 'poppins'),
        ),
      ),
      home: const Mainscreen(),
    );
  }
}
