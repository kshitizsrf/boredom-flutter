import 'package:boredom/elements/dartboard.dart';
import 'package:boredom/resources/colors.dart';
import 'package:boredom/resources/styles.dart';
import 'package:boredom/screens/activity_screen.dart';
import 'package:flutter/material.dart';

class BoredScreen extends StatefulWidget {
  const BoredScreen({super.key});

  @override
  State<BoredScreen> createState() => _BoredScreenState();
}

class _BoredScreenState extends State<BoredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dartboard(),
              const SizedBox(height: 40),

              const Text(
                "I'm Bored!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              const Text(
                "Discover fun activities to do in your free time.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActivityScreen(),
                  ),
                ),
                style: AppStyles.primaryButton,
                child: const Text(
                  "Find Something Fun!",
                  style: AppStyles.buttonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
