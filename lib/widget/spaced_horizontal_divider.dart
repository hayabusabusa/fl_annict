import 'package:flutter/material.dart';

class SpacedHorizontalDivider extends StatelessWidget {
  final double height;
  final double lSpace;
  final double rSpace;
  final Color color;

  const SpacedHorizontalDivider({
    this.height = 1,
    this.lSpace = 0,
    this.rSpace = 0,
    this.color = Colors.black45,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Left Spacer
          SizedBox(width: lSpace),
          // Divider
          Expanded(
            child: Container(height: height, color: color,),
          ),
          // Right Spacer
          SizedBox(width: rSpace,),
        ],
      ),
    );
  }
}