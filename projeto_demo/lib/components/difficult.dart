import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificultyLevel;

  const Difficulty({
    super.key,
    required this.dificultyLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 1)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 2)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 3)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 4)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 5)
              ? Colors.blue
              : Colors.blue[100],
        ),
      ],
    );
  }
}
