import 'package:flutter/services.dart';

class KeyboardConfig {
  static const List<LogicalKeyboardKey> leftKeys = [
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.keyA,
    LogicalKeyboardKey.keyJ,
    LogicalKeyboardKey.numpad4,
    LogicalKeyboardKey.keyT,
    LogicalKeyboardKey.keyV,
    LogicalKeyboardKey.comma,
    LogicalKeyboardKey.digit1,
  ];

  static const List<LogicalKeyboardKey> rightKeys = [
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.keyD,
    LogicalKeyboardKey.keyL,
    LogicalKeyboardKey.numpad6,
    LogicalKeyboardKey.keyU,
    LogicalKeyboardKey.keyB,
    LogicalKeyboardKey.period,
    LogicalKeyboardKey.digit2,
  ];

  static const LogicalKeyboardKey enterKey = LogicalKeyboardKey.enter;
  static const LogicalKeyboardKey pauseKey = LogicalKeyboardKey.keyP;
  static const LogicalKeyboardKey backKey = LogicalKeyboardKey.backspace;
}