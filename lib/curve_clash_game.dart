import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurveClashGame extends FlameGame with HasKeyboardHandlerComponents {
  late final PlayerComponent player;

  @override
  Future<void> onLoad() async {
    player = PlayerComponent()
      ..position = Vector2(100, 100)
      ..size = Vector2.all(20);
    add(player);

    add(
      KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.arrowLeft: (event) {
            player.turnLeft();
            return true;
          },
          LogicalKeyboardKey.arrowRight: (event) {
            player.turnRight();
            return true;
          },
        },
      ),
    );
  }
}

class PlayerComponent extends PositionComponent {
  double speed = 60.0;
  double angle = 0.0;
  List<Vector2> trail = [];

  void turnLeft() {
    angle -= 0.1;
  }

  void turnRight() {
    angle += 0.1;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(cos(angle), sin(angle)) * speed * dt;
    trail.add(position.clone());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()..color = const Color(0xFFFF66CC);
    canvas.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, paint);

    final trailPaint = Paint()..color = const Color(0xFFFF66CC).withOpacity(0.6);
    for (final point in trail) {
      canvas.drawCircle(
        Offset(point.x - position.x + size.x / 2, point.y - position.y + size.y / 2),
        2.5,
        trailPaint,
      );
    }
  }
}
