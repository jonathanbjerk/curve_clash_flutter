import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/overlays/start_overlay.dart';
import 'package:curve_clash_flutter/overlays/countdown_overlay.dart';
import 'package:curve_clash_flutter/overlays/pause_overlay.dart';
import 'package:curve_clash_flutter/overlays/round_overlay.dart';

class OverlayController {
  final CurveClashGame Function() gameGetter;

  OverlayController(this.gameGetter);

  Map<String, Widget Function(BuildContext, Game)> get builderMap => {
        'start': (_, game) => StartOverlay(game: game as CurveClashGame),
        'countdown': (_, game) => CountdownOverlay(game: game as CurveClashGame),
        'pause': (_, game) => PauseOverlay(game: game as CurveClashGame),
        'round': (_, game) => RoundOverlay(game: game as CurveClashGame),
      };

  List<String> get initialOverlays => ['start'];

  void show(String overlay) => gameGetter().overlays.add(overlay);

  void hide(String overlay) => gameGetter().overlays.remove(overlay);

  void hideAll() => gameGetter().overlays.clear();

  void showCountdown() {
    hideAll();
    show('countdown');
  }
}