import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SnakeGame extends FlameGame {
  late SnakePlayer player;

  @override
  Future<void> onLoad() async {
    player = SnakePlayer()
      ..position = size / 2
      ..anchor = Anchor.center;
    add(player);
  }
}

class SnakePlayer extends PositionComponent with KeyboardHandler {
  double speed = 100;
  double direction = 0;

  @override
  void update(double dt) {
    position += Vector2(cos(direction), sin(direction)) * speed * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        direction -= 0.1;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        direction += 0.1;
      }
    }
    return true;
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFF00FFFF); // neonblå
    canvas.drawCircle(Offset.zero, 10, paint);
  }
}
