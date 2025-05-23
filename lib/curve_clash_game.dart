
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';

class CurveClashGame extends FlameGame with HasKeyboardHandlerComponents {
  PlayerComponent? _player;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _spawnPlayer();

    add(
      KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.arrowLeft: (_) {
            _player?.turn(-1);
            return true;
          },
          LogicalKeyboardKey.arrowRight: (_) {
            _player?.turn(1);
            return true;
          },
        },
        keyUp: {
          LogicalKeyboardKey.arrowLeft: (_) {
            if (_player?.currentTurn == -1) _player?.turn(0);
            return true;
          },
          LogicalKeyboardKey.arrowRight: (_) {
            if (_player?.currentTurn == 1) _player?.turn(0);
            return true;
          },
        },
      ),
    );
  }

  void _spawnPlayer() {
    _player = PlayerComponent()
      ..position = canvasSize / 2
      ..size = Vector2.all(14);
    add(_player!);
  }

  void onPlayerDeath() => overlays.add('gameOver');

  void newRound() {
    overlays.remove('gameOver');
    children.removeWhere((c) => c is PlayerComponent);
    _player = null;
    _spawnPlayer();
  }
}

class PlayerComponent extends PositionComponent with HasGameRef<CurveClashGame> {
  double angle = 0;
  final double speed = 120;
  int currentTurn = 0;       // -1 left, 0 straight, 1 right
  final trail = <Vector2>[];

  void turn(int dir) => currentTurn = dir;

  @override
  void update(double dt) {
    super.update(dt);

    angle += currentTurn * 3 * dt;
    position += Vector2(cos(angle), sin(angle)) * speed * dt;
    trail.add(position.clone());

    final s = gameRef.size;
    if (position.x < 0 || position.y < 0 || position.x > s.x || position.y > s.y) {
      _die();
    }

    final skip = max(0, trail.length - 20);
    for (final p in trail.take(skip)) {
      if (position.distanceTo(p) < 8) {
        _die();
        break;
      }
    }
  }

  void _die() {
    removeFromParent();
    gameRef.onPlayerDeath();
  }

  @override
  void render(Canvas c) {
    final headPaint = Paint()..color = const Color(0xFFFF66CC);
    c.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, headPaint);

    final trailPaint = Paint()
      ..color = const Color(0xFFFF66CC).withOpacity(0.6);
    for (final p in trail) {
      c.drawCircle(
        Offset(p.x - position.x + size.x / 2, p.y - position.y + size.y / 2),
        2,
        trailPaint,
      );
    }
  }
}
