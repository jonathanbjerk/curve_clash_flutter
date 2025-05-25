import 'package:curve_clash_flutter/curve_clash_game.dart';
import 'package:curve_clash_flutter/managers/audio_manager.dart';
import 'package:flutter/material.dart';

class CountdownOverlay extends StatefulWidget {
  final CurveClashGame game;

  const CountdownOverlay({super.key, required this.game});

  @override
  State<CountdownOverlay> createState() => _CountdownOverlayState();
}

class _CountdownOverlayState extends State<CountdownOverlay> {
  int countdown = 3;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  Future<void> _startCountdown() async {
    while (countdown > 0) {
      await AudioManager.instance.play('count.wav');
      setState(() => countdown--);
      await Future.delayed(const Duration(seconds: 1));
    }

    await AudioManager.instance.play('go.wav');
    widget.game.startRound();
    widget.game.overlays.remove('countdown');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        countdown == 0 ? "GO!" : countdown.toString(),
        style: const TextStyle(
          fontSize: 100,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}