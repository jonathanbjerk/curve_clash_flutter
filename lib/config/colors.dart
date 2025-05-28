import 'package:flutter/material.dart';

class AppColors {
  static const Color player1 = Color(0xFF2ECBFB); // Neonblå
  static const Color player2 = Color(0xFFF76BFB); // Neonrosa
  static const Color textWhite = Colors.white;

  // Legg gjerne til flere spillerfarger ved behov:
  static const List<Color> all = [
    player1,
    player2,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
    Colors.cyan,
    Colors.pinkAccent,
  ];
}