
import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/config/colors.dart';
import 'package:curve_clash_flutter/config/button_styles.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/managers/audio_manager.dart';

class PauseOverlay extends StatelessWidget {
  final CurveClashGame game;

  const PauseOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Pauset", style: TextStyle(color: AppColors.textWhite, fontSize: 32)),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              AudioManager.play(SfxType.click);
              game.resumeEngine();
              game.overlays.remove('PauseOverlay');
            },
            style: borderedButtonStyle(PlayerColors.colors[0]),
            child: const Text("Fortsett"),
          ),
        ],
      ),
    );
  }
}
