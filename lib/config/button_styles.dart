
import 'package:flutter/material.dart';

ButtonStyle borderedButtonStyle(Color borderColor) {
  return OutlinedButton.styleFrom(
    side: BorderSide(color: borderColor, width: 2),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontSize: 18),
  );
}
