import 'dart:math';

import 'package:flutter/material.dart';

class BoredScreen extends StatefulWidget {
  const BoredScreen({super.key});

  @override
  State<BoredScreen> createState() => _BoredScreenState();
}

class _BoredScreenState extends State<BoredScreen>
    with TickerProviderStateMixin {
  late AnimationController zoomCtrl, dartCtrl, shakeCtrl;
  late Animation<Offset> slideAnim;
  bool showZoom = false;
  bool showDart = false;
  bool shakeBoard = false;

  @override
  void initState() {
    super.initState();

    zoomCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    dartCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    shakeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    Future.delayed(const Duration(milliseconds: 200), () async {
      setState(() => showZoom = true);
      await Future.delayed(const Duration(milliseconds: 600)); // wait for zoom
      setState(() => showDart = true);
      await Future.delayed(const Duration(milliseconds: 300)); // wait for dart
      setState(() => shakeBoard = true);
    });
  }

  @override
  void dispose() {
    zoomCtrl.dispose();
    dartCtrl.dispose();
    shakeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.lightBlue[100],
                    child: AnimatedBuilder(
                      animation: shakeCtrl,
                      builder: (context, child) {
                        final dx = sin(shakeCtrl.value * 10 * pi);
                        return Transform.translate(
                          offset: Offset(dx, 0),
                          child: child,
                        );
                      },
                      child: AnimatedScale(
                        scale: showZoom ? 1 : 0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutBack,
                        child: ClipOval(
                          child: Image.asset(
                            "lib/assets/dartboard2.png",
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (showDart)
                    TweenAnimationBuilder(
                      tween: Tween<Offset>(
                        begin: const Offset(70, -50),
                        end: Offset(32, -30),
                      ),
                      duration: const Duration(milliseconds: 400),
                      onEnd: () => shakeCtrl.forward(from: 0),
                      curve: Curves.elasticOut,
                      builder: (context, offset, child) {
                        return Transform.translate(
                          offset: offset,
                          child: child,
                        );
                      },
                      child: Image.asset(
                        "lib/assets/dart2.png",
                        width: 70,
                        height: 70,
                      ),
                    ),
                ],
              ),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Find Something Fun!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
