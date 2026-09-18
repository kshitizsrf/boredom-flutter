import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  // Button style
  static final ButtonStyle primaryButton =
      ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
      ).copyWith(
        elevation: WidgetStateProperty.resolveWith<double>(
          (states) => states.contains(WidgetState.pressed) ? 0 : 2,
        ),
      );

  // Text styles
  static const TextStyle screenTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: AppColors.buttonText,
  );
}
