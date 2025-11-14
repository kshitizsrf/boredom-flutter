import 'package:boredom/resources/styles.dart';
import 'package:flutter/material.dart';
import '../resources/colors.dart';

Widget clickableChip({
  required String text,
  IconData? icon,
  required VoidCallback onTap,
  Color? bgColor,
  Color? textColor,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          icon != null ? Icon(icon) : SizedBox(),
          icon != null ? SizedBox(width: 4) : SizedBox(),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: textColor ?? AppColors.buttonText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget actionButton({
  required String text,
  IconData? icon,
  required VoidCallback onPressed,
  Color? bgColor,
  Color? textColor,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: AppStyles.primaryButton,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.autorenew, size: 28, color: Colors.white),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}
