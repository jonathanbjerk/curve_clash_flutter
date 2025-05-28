import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/config/colors.dart';
import 'package:curve_clash_flutter/managers/collision_manager.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';

class Snake extends PositionComponent with HasGameRef<CurveClashGame> {
  final Color color;
  double angle;
  double speed = 100.0;
  bool isDead = false;
  double gapTimer = 0.0;
  bool isInGap = false;
  double aliveTime = 0.0;
  List<List<Vector2>> trailSegments = [[]];

  Snake({required this.color, required Vector2 startPosition, double startAngle = 0})
      : angle = startAngle {
    position = startPosition.clone();
  }

  void start() {
    isDead = false;
    trailSegments = [[]];
    aliveTime = 0.0;
  }

  void reset(Vector2 pos, double newAngle) {
    position = pos.clone();
    angle = newAngle;
    isDead = false;
    trailSegments = [[]];
    aliveTime = 0.0;
    gapTimer = 0.0;
    isInGap = false;
  }

  void turnLeft() {
    angle -= 0.05;
  }

  void turnRight() {
    angle += 0.05;
  }

  @override
  void update(double dt) {
    if (isDead) return;
    aliveTime += dt;
    final direction = Vector2(math.cos(angle), math.sin(angle));
    position += direction * speed * dt;

    gapTimer += dt;
    if (gapTimer >= 3.5) {
      gapTimer = 0.0;
      isInGap = false;
      trailSegments.add([]);
    } else if (gapTimer >= 3.2) {
      isInGap = true;
    }

    if (!isInGap) {
      trailSegments.last.add(position.clone());
    }

    if (aliveTime > 1.0 &&
        CollisionManager.checkCollision(
          gameRef: gameRef,
          position: position,
          trailSegments: trailSegments,
          snake: this,
        )) {
      isDead = true;
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = color;
    for (final segment in trailSegments) {
      for (int i = 1; i < segment.length; i++) {
        canvas.drawLine(
          Offset(segment[i - 1].x, segment[i - 1].y),
          Offset(segment[i].x, segment[i].y),
          paint..strokeWidth = 4,
        );
      }
    }

    canvas.drawCircle(Offset(position.x, position.y), 4, paint);

    final debugPaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(position.x, position.y), 2.5, debugPaint);
  }
}