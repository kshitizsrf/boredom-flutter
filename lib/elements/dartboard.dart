import 'package:boredom/resources/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Dartboard extends StatefulWidget {
  const Dartboard({super.key});

  @override
  State<Dartboard> createState() => _DartboardState();
}

class _DartboardState extends State<Dartboard> with TickerProviderStateMixin {
  late AnimationController zoomCtrl, dartCtrl, shakeCtrl;
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
      duration: const Duration(milliseconds: 100),
    );
    shakeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    Future.delayed(const Duration(milliseconds: 200), () async {
      setState(() => showZoom = true);
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() => showDart = true);
      await Future.delayed(const Duration(milliseconds: 100));
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
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: AppColors.primary,
          child: AnimatedBuilder(
            animation: shakeCtrl,
            builder: (context, child) {
              final dx = shakeBoard ? sin(shakeCtrl.value * 10 * pi) * 2 : 0.0;
              return Transform.translate(offset: Offset(dx, 0), child: child);
            },
            child: AnimatedScale(
              scale: showZoom ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutBack,
              child: ClipOval(
                child: Image.asset(
                  "lib/assets/dartboard.png",
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
              end: const Offset(32, -30),
            ),
            duration: const Duration(milliseconds: 100),
            onEnd: () => shakeCtrl.forward(from: 0),
            curve: Curves.easeOutBack,
            builder: (context, offset, child) =>
                Transform.translate(offset: offset, child: child),
            child: Image.asset("lib/assets/dart.png", width: 70, height: 70),
          ),
      ],
    );
  }
}
