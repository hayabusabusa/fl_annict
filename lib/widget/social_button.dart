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

  Color get color {
    switch (this) {
      case SocialType.official:
        return Colors.blueGrey;
      case SocialType.twitter:
        return Colors.blue;
      case SocialType.wikipedia:
        return Colors.black;
      default:
        return Colors.blue;
    }
  }
}

class SocialButton extends StatelessWidget {
  final SocialType type;
  final Color imageColor;
  final VoidCallback onPressed;

  const SocialButton({
    @required this.type, 
    this.imageColor = Colors.white,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: type.color,
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