import 'package:boredom/widgets/dartboard.dart';
import 'package:boredom/resources/colors.dart';
import 'package:boredom/resources/styles.dart';
import 'package:boredom/screens/activity_screen.dart';
import 'package:boredom/widgets/typewriter_text.dart';
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

              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1200),
                tween: Tween(begin: 0.2, end: 1.0),
                curve: Curves.easeInOutSine,
                builder: (_, value, child) {
                  return Transform.scale(scale: value, child: child);
                },
                child: const Text(
                  "I'm Bored!",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              TypeWriterText(
                "Discover fun activities to do in your free time.",
                speed: Duration(milliseconds: 30),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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
