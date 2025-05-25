import 'package:flutter/material.dart';
import '../curve_clash_game.dart';

class RoundOverlay extends StatelessWidget {
  final CurveClashGame game;
  const RoundOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(onPressed: game.nextRound, child: const Text("Neste runde")),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: game.returnToMenu, child: const Text("Tilbake til start")),
        ],
      ),
    );
  }
}
