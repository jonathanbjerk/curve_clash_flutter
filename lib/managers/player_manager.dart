import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../components/player_component.dart';
import '../curve_clash_game.dart';

class PlayerColors {
  static const p1 = Color(0xFF00FFFF);
  static const p2 = Color(0xFFFF00FF);
}

class PlayerManager extends Component {
  final CurveClashGame game;

  late CurvePlayer p1;
  late CurvePlayer p2;

  int p1Score = 0;
  int p2Score = 0;

  PlayerManager(this.game);

  void spawnPlayers() {
    p1 = CurvePlayer(
      playerId: 1,
      startPosition: Vector2(100, 300),
      color: PlayerColors.p1,
    );

    p2 = CurvePlayer(
      playerId: 2,
      startPosition: Vector2(700, 300),
      color: PlayerColors.p2,
    );

    addAll([p1, p2]);
  }

  void reset() {
    removeAll(children);
    spawnPlayers();
  }
}