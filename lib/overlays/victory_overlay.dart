import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';

class VictoryOverlay extends StatelessWidget {
  final CurveClashGame game;

  const VictoryOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Gratulerer med seieren!'),
          ElevatedButton(
            onPressed: () {
              game.resetGame();
              game.overlays.remove('victory');
              game.overlays.add('start');
            },
            child: const Text('Nytt spill'),
          )
        ],
      ),
    );
  }
}