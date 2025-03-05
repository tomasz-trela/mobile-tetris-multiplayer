import 'package:flutter/material.dart';

class GameResultWidget extends StatelessWidget {
  const GameResultWidget({
    super.key, 
    required this.color, 
    required this.title, 
    required this.result
  });

  final Color color;
  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Text(
            title,
            style: textTheme.headlineMedium,
          ),
          Text(
            result,
            style: textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}