import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';

class OverlayController {
  final CurveClashGame game;

  OverlayController(this.game);

  void showRoundOverlay(String winnerName, Color winnerColor) {
    game.overlays.add('RoundOverlay');
    game.roundWinnerName = winnerName;
    game.roundWinnerColor = winnerColor;
  }

  void hideRoundOverlay() {
    game.overlays.remove('RoundOverlay');
  }

  void showVictoryOverlay(String winnerName, Color winnerColor) {
    game.overlays.add('VictoryOverlay');
    game.matchWinnerName = winnerName;
    game.matchWinnerColor = winnerColor;
  }

  void hideVictoryOverlay() {
    game.overlays.remove('VictoryOverlay');
  }

  void showStartOverlay() {
    game.overlays.add('StartOverlay');
  }

  void hideStartOverlay() {
    game.overlays.remove('StartOverlay');
  }

  void showCountdownOverlay() {
    game.overlays.add('CountdownOverlay');
  }

  void hideCountdownOverlay() {
    game.overlays.remove('CountdownOverlay');
  }
}