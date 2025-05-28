import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/components/player/player_component.dart';

class GameManager extends Component with HasGameRef<CurveClashGame> {
  GameManager({required this.game});
  final CurveClashGame game;

  void startCountdown() {
    game.overlays.add('countdown');
  }

  void startRound() {
    for (final player in game.playerManager.players) {
      player.snake.start();
    }
  }

  void resetGame() {
    game.scoreManager.resetScores();
    game.playerManager.resetPlayers();
  }

  void handleEndRound() {
    game.overlays.add('round');
  }

  void handleEndMatch() {
    game.overlays.add('victory');
  }

  void handleKeyboardInput(Set<LogicalKeyboardKey> keys, CurveClashGame game) {
    for (final player in game.playerManager.players) {
      if (keys.contains(player.leftKey)) {
        player.snake.turnLeft();
      } else if (keys.contains(player.rightKey)) {
        player.snake.turnRight();
      }
    }
  }
}