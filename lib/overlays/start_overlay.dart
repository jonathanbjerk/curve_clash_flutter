import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/player_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartOverlay extends StatelessWidget {
  final CurveClashGame game;

  const StartOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/curve_clash_logo_offisiell.png',
                width: 300,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 180,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    game.overlayController.showCountdown();
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: PlayerColors.p2, width: 2),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
