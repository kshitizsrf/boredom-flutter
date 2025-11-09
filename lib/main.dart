import 'package:boredom/screens/bored_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BoredApp());

class BoredApp extends StatelessWidget {
  const BoredApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BoredScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
