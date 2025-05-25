import 'package:flutter/material.dart';
import '../curve_clash_game.dart';
import '../constants/colors.dart';

class StartOverlay extends StatelessWidget {
  final CurveClashGame game;

  const StartOverlay({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/starfield.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/curve_clash_logo_offisiell.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                const SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () => game.startCountdown(),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black, // 🟩 svart bakgrunn
                    side: const BorderSide(color: AppColors.p2, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}