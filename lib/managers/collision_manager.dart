import 'package:flame/components.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:curve_clash_flutter/components/snake.dart';
import 'package:curve_clash_flutter/managers/wall_manager.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';

class CollisionManager {
  static bool checkCollision({
    required CurveClashGame gameRef,
    required Vector2 position,
    required List<List<Vector2>> trailSegments,
    required Snake snake,
    double collisionRadius = 2.5,
  }) {
    // Self collision (skip latest segment)
    final flatTrail = trailSegments.expand((s) => s).toList();
    for (final point in flatTrail.skip(20).take(flatTrail.length - 30)) {
      if (point.distanceTo(position) < collisionRadius) return true;
    }

    // Other snakes
    final others = gameRef.playerManager.players
        .where((p) => p.snake != snake)
        .map((p) => p.snake.trailSegments.expand((s) => s))
        .expand((s) => s);
    for (final point in others) {
      if (point.distanceTo(position) < collisionRadius) return true;
    }

    // Wall collision
    final wallManager = gameRef.children.query<WallManager>().firstOrNull;
    if (wallManager != null &&
        wallManager.collidesWith(position, margin: collisionRadius)) {
      return true;
    }

    return false;
  }
}