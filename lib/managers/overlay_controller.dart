import 'package:curve_clash_flutter/curve_clash_game.dart';

class OverlayController {
  final CurveClashGame game;

  OverlayController(this.game);

  void removeAll() {
    game.overlays.clear();
  }

  void showCountdown() {
    game.overlays.add('countdown');
  }
}