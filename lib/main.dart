import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //Color primaryColor = Color.fromARGB(255, 36, 68, 119);
  Color primaryColor = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpress Documents',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.grey[50],
        colorScheme: const ColorScheme.light().copyWith(
          primary: primaryColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
