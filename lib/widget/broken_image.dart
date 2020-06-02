import 'package:flutter/material.dart';

class BrokenImage extends StatelessWidget {
  final double width;
  final double height;

  const BrokenImage({
    this.width = 0,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.black12,
      child: const Icon(
        Icons.broken_image,
        color: Colors.grey,
      ),
    );
  }
}