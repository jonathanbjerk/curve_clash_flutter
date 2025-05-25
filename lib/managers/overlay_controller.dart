import 'package:flutter/material.dart';
import '../curve_clash_game.dart';
import '../overlays/start_overlay.dart';
import '../overlays/countdown_overlay.dart';

class OverlayController {
  late CurveClashGame _game;

  void setGame(CurveClashGame game) {
    _game = game;
  }

  Map<String, Widget Function(BuildContext, CurveClashGame)> get builderMap => {
        'StartOverlay': (context, game) => StartOverlay(game: game),
        'CountdownOverlay': (context, game) => CountdownOverlay(game: game),
      };

  void showOverlay(String name) {
    _game.overlays.add(name);
  }

  void hideOverlay(String name) {
    _game.overlays.remove(name);
  }
}