import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';

class RoundOverlay extends StatelessWidget {
  final CurveClashGame game;

  const RoundOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          game.startCountdown();
          game.overlays.remove('round');
        },
        child: const Text('Neste runde'),
      ),
    );
  }
}