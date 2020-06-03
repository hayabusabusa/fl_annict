import 'package:flutter/material.dart';

class BorderedChip extends StatelessWidget {
  final String text;
  final Color color;

  const BorderedChip({
    @required this.text,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      child: Text(
        text, 
        style: TextStyle(color: color),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(999)
      ),
    );
  }
}