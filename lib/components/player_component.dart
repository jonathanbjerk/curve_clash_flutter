import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CurvePlayer extends PositionComponent {
  final int playerId;
  final Vector2 startPosition;
  final Color color;

  CurvePlayer({
    required this.playerId,
    required this.startPosition,
    required this.color,
  });

  @override
  Future<void> onLoad() async {
    position = startPosition;
    size = Vector2.all(8);
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = color;
    canvas.drawCircle(Offset.zero, 4, paint);
  }
}