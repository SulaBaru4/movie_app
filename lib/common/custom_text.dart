import 'package:flutter/material.dart';

/// Widget for customized style of texts, where first letter has different color
///
/// [text] - full text, which will be shown,
/// [firstLetterColor] - first letter's color
/// [remainingTextColor] - remaining letters color

class CustomText extends StatelessWidget {
  final String text;
  final Color firstLetterColor;
  final Color remainingTextColor;

  const CustomText({
    super.key,
    required this.text,
    required this.firstLetterColor,
    required this.remainingTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 24),
        children: [
          TextSpan(
            text: text[0], // Первая буква
            style: TextStyle(color: firstLetterColor, fontWeight: FontWeight.bold, ),
          ),
          TextSpan(
            text: text.substring(1), // Остальная часть текста
            style: TextStyle(color: remainingTextColor),
          ),
        ],
      ),
    );
  }
}
