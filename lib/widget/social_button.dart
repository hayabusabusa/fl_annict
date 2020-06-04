import 'package:flutter/material.dart';

enum SocialType {
  official,
  twitter,
  wikipedia,
}

extension SocialTypeExtension on SocialType {
  String get assetPath {
    switch (this) {
      case SocialType.official:
        return 'assets/ic_official.png';
      case SocialType.twitter:
        return 'assets/ic_twitter.png';
      case SocialType.wikipedia:
        return 'assets/ic_wikipedia.png';
      default:
        return 'UNKNOWN';
    }
  }
}

class SocialButton extends StatelessWidget {
  final SocialType type;
  final Color color;
  final Color imageColor;
  final VoidCallback onPressed;

  const SocialButton({
    @required this.type, 
    this.color = Colors.blue,
    this.imageColor = Colors.white,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      disabledColor: Colors.black26,
      shape: CircleBorder(),
      onPressed: onPressed, 
      child: Image.asset(
        type.assetPath,
        color: imageColor,
        width: 20,
        height: 20,
      ),
    );
  }
}