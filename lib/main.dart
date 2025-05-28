import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/overlays/start_overlay.dart';
import 'package:curve_clash_flutter/overlays/countdown_overlay.dart';
import 'package:curve_clash_flutter/overlays/pause_overlay.dart';
import 'package:curve_clash_flutter/overlays/round_overlay.dart';
import 'package:curve_clash_flutter/overlays/victory_overlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) => runApp(GameWidget<CurveClashGame>(
            game: CurveClashGame(),
            overlayBuilderMap: {
              'StartOverlay': (context, game) => StartOverlay(game: game),
              'CountdownOverlay': (context, game) => CountdownOverlay(game: game),
              'PauseOverlay': (context, game) => PauseOverlay(game: game),
              'RoundOverlay': (context, game) => RoundOverlay(
                    game: game,
                    winnerName: '',
                    winnerColor: Colors.white,
                  ),
              'VictoryOverlay': (context, game) => VictoryOverlay(
                    game: game,
                    winnerName: '',
                    winnerColor: Colors.white,
                  ),
            },
            initialActiveOverlays: const ['StartOverlay'],
          )));
}