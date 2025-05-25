import 'package:flame/components.dart';
import 'package:flutter/material.dart';

enum ControlScheme { wasd, arrows }

class Snake extends PositionComponent {
  final Color color;
  final ControlScheme controlScheme;
  final int playerId;

  Snake({
    required this.color,
    required this.controlScheme,
    required this.playerId,
  });

  @override
  void update(double dt) {
    // Snake movement logic goes here
  }

  void reset() {
    // Reset snake to initial state
  }
}