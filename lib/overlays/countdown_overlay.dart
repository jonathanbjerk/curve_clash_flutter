
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/config/colors.dart';
import 'package:curve_clash_flutter/managers/audio_manager.dart';

class CountdownOverlay extends StatefulWidget {
  final CurveClashGame game;

  const CountdownOverlay({super.key, required this.game});

  @override
  State<CountdownOverlay> createState() => _CountdownOverlayState();
}

class _CountdownOverlayState extends State<CountdownOverlay> {
  final List<String> steps = ['3', '2', '1', 'GO!'];
  int stepIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    AudioManager.play(SfxType.count);
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        stepIndex++;
      });

      if (stepIndex < steps.length - 1) {
        AudioManager.play(SfxType.count);
      } else if (stepIndex == steps.length - 1) {
        AudioManager.play(SfxType.go);
      } else {
        widget.game.overlays.remove('CountdownOverlay');
        Future.delayed(const Duration(milliseconds: 200), () {
          widget.game.startRound(); // start etter GO! er borte
        });
        timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isGo = stepIndex >= steps.length - 1;
    final text = isGo ? 'GO!' : steps[stepIndex];
    final textColor = isGo ? AppColors.success : AppColors.textWhite;
    final underlineColor = isGo ? AppColors.success : AppColors.highlight;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: textColor,
              decoration: TextDecoration.underline,
              decorationColor: underlineColor,
              decorationThickness: 0.8,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
