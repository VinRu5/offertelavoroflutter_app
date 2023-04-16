import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class TagColor extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color color;

  const TagColor({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 1.5,
          horizontal: 8.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
