
import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/config/colors.dart';
import 'package:curve_clash_flutter/config/button_styles.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/widgets/starfield_widget.dart';
import 'package:curve_clash_flutter/managers/audio_manager.dart';

class StartOverlay extends StatelessWidget {
  final CurveClashGame game;

  const StartOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const StarfieldWidget(),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/curve_clash_logo_offisiell.png',
                scale: 2.8,
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  debugPrint('🟢 Start-knapp trykket');
                  AudioManager.play(SfxType.click);
                  game.overlays.remove('StartOverlay');
                  game.startCountdown();
                },
                style: borderedButtonStyle(PlayerColors.colors[0]).copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text(
                  'Start spill',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
