import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';
import 'package:flutter/services.dart';
import 'package:flame/collisions.dart';
import '../curve_clash_game.dart';

class Snake extends PositionComponent
    with HasGameRef<CurveClashGame>, KeyboardHandler, CollisionCallbacks {
  bool active = false;
  static const double speed = 100;
  static const double turnSpeed = pi;
  double angle;
  final List<Vector2> trail = [];
  double trailTimer = 0;
  bool skipSegment = false;

  Snake({required Vector2 startPosition, double? initialAngle})
      : angle = initialAngle ?? Random().nextDouble() * 2 * pi {
    position = startPosition;
    trail.add(startPosition.clone());
    size = Vector2.all(10);
    print("🐍 Snake opprettet på $startPosition med vinkel $angle");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    print("🎨 Snake render() på posisjon $position");

    final trailPaint = Paint()..color = const Color(0xFF00FFFF);
    final path = Path();
    if (trail.isNotEmpty) {
      path.moveTo(trail.first.x, trail.first.y);
      for (final point in trail.skip(1)) {
        path.lineTo(point.x, point.y);
      }
      canvas.drawPath(path, trailPaint);
    }

    final paint = Paint()..color = const Color(0xFF00FFFF);
    canvas.save();
    canvas.translate(position.x + size.x / 2, position.y + size.y / 2);
    canvas.rotate(angle);
    canvas.translate(-size.x / 2, -size.y / 2);
    canvas.drawRect(size.toRect(), paint);
    canvas.restore();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!active) return;

    final direction = Vector2(cos(angle), sin(angle));
    position += direction * speed * dt;

    trailTimer += dt;
    if (trailTimer >= 0.05) {
      trailTimer = 0;
      if (!skipSegment) trail.add(position.clone());
      skipSegment = Random().nextDouble() < 0.05;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    print("💥 Kollisjon med ${other.runtimeType}");
    if (other is! Snake) {
      active = false;
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        angle -= turnSpeed * 0.1;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        angle += turnSpeed * 0.1;
      }
    }
    return true;
  }
}