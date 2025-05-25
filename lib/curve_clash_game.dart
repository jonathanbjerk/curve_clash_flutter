import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/extensions.dart';
import 'managers/player_manager.dart';
import 'managers/overlay_controller.dart';
import 'managers/audio_manager.dart';
import 'components/wall_manager.dart';

class CurveClashGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  final OverlayController overlayController;
  late final PlayerManager playerManager;
  late final WallManager wallManager;

  CurveClashGame({required this.overlayController});

  @override
  Future<void> onLoad() async {
    wallManager = WallManager();
    playerManager = PlayerManager(this);
    await add(wallManager);
    await add(playerManager);

    await AudioManager.instance.initialize();
    overlayController.setGame(this);
    overlayController.showOverlay('StartOverlay');
  }

  void startRound() {
    playerManager.activateAllSnakes();
  }

  void startCountdown() async {
    await Future.delayed(Duration.zero); // 👈 sikrer riktig game.size
    playerManager.spawnPlayers();
    overlayController.hideOverlay('StartOverlay');
    overlayController.showOverlay('CountdownOverlay');
  }

  void resetGame() {
    playerManager.removePlayers();
    overlayController.showOverlay('StartOverlay');
  }
}