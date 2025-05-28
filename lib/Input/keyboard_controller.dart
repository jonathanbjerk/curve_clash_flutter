import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';

class KeyboardController extends Component with KeyboardHandler {
  final void Function(Set<LogicalKeyboardKey>) onInput;

  KeyboardController({required this.onInput});

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    onInput(keysPressed);
    return false;
  }
}