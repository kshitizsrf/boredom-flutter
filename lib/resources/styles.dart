import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  // Button style
  static final ButtonStyle primaryButton =
      ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
      ).copyWith(
        elevation: WidgetStateProperty.resolveWith<double>(
          (states) => states.contains(WidgetState.pressed) ? 0 : 4,
        ),
      );

  // Text styles
  static const TextStyle title = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
