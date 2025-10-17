import 'package:flutter/material.dart';
import 'package:todo_app/utils/font_contraint.dart';

class CircleAvatorScreen extends StatelessWidget {
  const CircleAvatorScreen({
    super.key,
    required this.titleText,
    required this.avatarImage,
  });
  final String titleText;

  final String avatarImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: TextStyle(
            fontSize: FontContraint.headingMedium,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(width: 50),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            avatarImage,
            height: 65,
            width: 65,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
