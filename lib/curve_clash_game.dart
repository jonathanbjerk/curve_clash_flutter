import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'components/starfield_background.dart';
import 'components/wall_manager.dart';
import 'managers/player_manager.dart';
import 'managers/overlay_controller.dart';
import 'managers/audio_manager.dart';

class CurveClashGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  final OverlayController overlayController;
  late final WallManager wallManager;
  late final PlayerManager playerManager;

  CurveClashGame({required this.overlayController});

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(Vector2(800, 600));

    add(StarfieldBackground());

    wallManager = WallManager();
    add(wallManager);

    playerManager = PlayerManager(this);
    add(playerManager);

    AudioManager.instance.initialize();

    overlayController.showOverlay('start');
  }

  void startRound() {
    overlayController.hideOverlay('countdown');
    playerManager.spawnPlayers();
  }

  void nextRound() {
    playerManager.removePlayers();
    overlayController.showOverlay('start');
  }

  void returnToMenu() {
    playerManager.removePlayers();
    overlayController.showOverlay('start');
  }

  void showCountdown() {
    overlayController.showOverlay('countdown');
  }
}