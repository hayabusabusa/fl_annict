import 'package:flutter/material.dart';

enum SocialType {
  official,
  twitter,
  wikipedia,
}

extension SocialTypeExtension on SocialType {
  Image get image {
    switch (this) {
      case SocialType.official:
        return Image.asset('');
      case SocialType.twitter:
        return Image.asset('');
      case SocialType.wikipedia:
        return Image.asset('');
      default:
        return null;
    }
  }
}

class SocialButton extends StatelessWidget {
  final SocialType type;
  final Color color;
  final VoidCallback onPressed;

  const SocialButton({
    @required this.type, 
    this.color = Colors.blue,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed, 
      child: type.image,
      shape: CircleBorder(),
      color: color,
    );
  }
}