import 'package:bloc_random_arya/random_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Random Arya',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RandomScreen(),
    );
  }
}
