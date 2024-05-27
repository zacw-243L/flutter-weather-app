import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/addcity_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/addCity': (context) => const AddCityScreen(),
      },
    );
  }
}
