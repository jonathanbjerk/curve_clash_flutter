import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/managers/game_manager.dart';
import 'package:curve_clash_flutter/managers/player_manager.dart';
import 'package:curve_clash_flutter/managers/overlay_controller.dart';
import 'package:curve_clash_flutter/managers/camera_manager.dart';
import 'package:curve_clash_flutter/managers/score_manager.dart';

class CurveClashGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection {
  late final PlayerManager playerManager;
  late final GameManager gameManager;
  late final OverlayController overlayController;
  late final CameraManager cameraManager;
  late final ScoreManager scoreManager;

  CurveClashGame() {
    playerManager = PlayerManager();
    gameManager = GameManager(game: this);
    cameraManager = CameraManager(this);
    overlayController = OverlayController(this);
    scoreManager = ScoreManager(playerManager);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    addAll([
      playerManager,
      gameManager,
      cameraManager,
    ]);
  }

  void handleKeyboardInput(Set<LogicalKeyboardKey> keysPressed) {
    gameManager.handleKeyboardInput(keysPressed, this);
  }

  void startCountdown() => gameManager.startCountdown();
  void startRound() => gameManager.startRound();
  void resetGame() => gameManager.resetGame();
  void handleEndRound() => gameManager.handleEndRound();
  void handleEndMatch() => gameManager.handleEndMatch();

  String roundWinnerName = '';
  Color roundWinnerColor = Colors.white;
  String matchWinnerName = '';
  Color matchWinnerColor = Colors.white;
}