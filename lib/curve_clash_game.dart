import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/services.dart';

class CurveClashGame extends FlameGame with HasKeyboardHandlerComponents {
  late PlayerComponent _player;

  @override
  Future<void> onLoad() async {
    await FlameAudio.audioCache.load('crash.wav');
    _spawnPlayer();

    add(
      KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.arrowLeft: (_) {
            _player.turn(-1);
            return true;
          },
          LogicalKeyboardKey.arrowRight: (_) {
            _player.turn(1);
            return true;
          },
        },
        keyUp: {
          LogicalKeyboardKey.arrowLeft: (_) {
            if (_player.turnDir == -1) _player.turn(0);
            return true;
          },
          LogicalKeyboardKey.arrowRight: (_) {
            if (_player.turnDir == 1) _player.turn(0);
            return true;
          },
        },
      ),
    );
  }

  void _spawnPlayer() {
    _player = PlayerComponent()
      ..position = canvasSize / 2
      ..size = Vector2.all(12);
    add(_player);
  }

  void onPlayerDeath() {
    FlameAudio.play('crash.wav');
    pauseEngine();
    overlays.add('gameOver');
  }

  void newRound() {
    overlays.remove('gameOver');
    children.whereType<PlayerComponent>().forEach((c) => c.removeFromParent());
    _spawnPlayer();
    resumeEngine();
  }
}

class PlayerComponent extends PositionComponent with HasGameRef<CurveClashGame> {
  @override
  double angle = 0;
  int turnDir = 0;
  void turn(int dir) => turnDir = dir;

  final double speed = 120;
  final trail = <Vector2>[];

  double _timer = 0;
  bool _drawing = true;
  static const double holeEvery = 6.0;
  static const double holeLen = 0.25;
  static const double collisionRadius = 6;

  @override
  void update(double dt) {
    super.update(dt);

    angle += turnDir * 3 * dt;
    position += Vector2(cos(angle), sin(angle)) * speed * dt;

    _timer += dt;
    if (_drawing) {
      trail.add(position.clone());
      if (_timer > holeEvery) {
        _timer = 0;
        _drawing = false;
      }
    } else {
      if (_timer > holeLen) {
        _timer = 0;
        _drawing = true;
      }
    }

    final s = gameRef.size;
    if (position.x < 0 || position.y < 0 || position.x > s.x || position.y > s.y) {
      _die();
    }

    for (int i = 0; i < trail.length - 15; i++) {
      if (position.distanceTo(trail[i]) < collisionRadius) {
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
    final paint = Paint()..color = const Color(0xFF66CCFF).withOpacity(0.8);
    for (final p in trail) {
      c.drawCircle(Offset(p.x - position.x, p.y - position.y), 3, paint);
    }
  }
}