import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/managers/overlay_controller.dart';

void main() {
  final game = CurveClashGame();
  final overlayController = OverlayController(game);
  game.overlayController = overlayController;

  runApp(
    GameWidget(
      game: game,
      overlayBuilderMap: overlayController.builderMap,
      initialActiveOverlays: overlayController.initialOverlays,
    ),
  );
}