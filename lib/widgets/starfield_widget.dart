import 'package:flutter/material.dart';

class StarfieldWidget extends StatelessWidget {
  final double opacity;

  const StarfieldWidget({super.key, this.opacity = 1.0});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Image.asset(
        'assets/images/starfield.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
