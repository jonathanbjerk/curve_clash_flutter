import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'curve_clash_game.dart';
import 'managers/overlay_controller.dart';

void main() {
  final overlayController = OverlayController();

  final game = CurveClashGame(overlayController: overlayController);

  runApp(
    GameWidget(
      game: game,
      overlayBuilderMap: overlayController.builderMap,
    ),
  );
}