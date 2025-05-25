import 'package:flutter/material.dart';
import '../curve_clash_game.dart';

class PauseOverlay extends StatelessWidget {
  final CurveClashGame game;

  const PauseOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Poeng: Turkis: ${game.playerManager.p1Score}  •  Rosa: ${game.playerManager.p2Score}',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.overlays.remove('PauseOverlay');
              game.resumeEngine();
            },
            child: const Text('Fortsett'),
          ),
        ],
      ),
    );
  }
}
