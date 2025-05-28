
import 'package:curve_clash_flutter/managers/player_manager.dart';
import 'package:curve_clash_flutter/components/player/player_component.dart';

class ScoreManager {
  final PlayerManager playerManager;

  ScoreManager(this.playerManager);

  void incrementScore(String playerName) {
    final player = playerManager.players.firstWhere((p) => p.name == playerName);
    player.score++;
  }

  void resetAll() {
    for (final player in playerManager.players) {
      player.score = 0;
    }
  }

  PlayerComponent? getWinningPlayer() {
    final max = playerManager.players.map((p) => p.score).reduce((a, b) => a > b ? a : b);
    return playerManager.players.firstWhere((p) => p.score == max);
  }
}
