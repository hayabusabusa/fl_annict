import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final double fontSize;

  const IconText({
    @required this.icon,
    this.iconColor = Colors.blue,
    @required this.text,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}