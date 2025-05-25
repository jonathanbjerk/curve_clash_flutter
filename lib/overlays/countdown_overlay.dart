import 'package:flutter/material.dart';
import '../curve_clash_game.dart';
import '../constants/colors.dart';
import '../managers/audio_manager.dart';

class CountdownOverlay extends StatefulWidget {
  final CurveClashGame game;

  const CountdownOverlay({Key? key, required this.game}) : super(key: key);

  @override
  State<CountdownOverlay> createState() => _CountdownOverlayState();
}

class _CountdownOverlayState extends State<CountdownOverlay> {
  int counter = 3;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() async {
    while (counter > 0) {
      await AudioManager.instance.play('count.wav');
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        counter--;
      });
    }

    await AudioManager.instance.play('go.wav');
    setState(() {}); // vis "GO!"
    await Future.delayed(const Duration(milliseconds: 600)); // la det stå en liten stund

    widget.game.overlays.remove('CountdownOverlay');
    widget.game.startRound();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        counter > 0 ? '$counter' : 'GO!',
        style: TextStyle(
          fontSize: 64,
          color: counter > 0 ? Colors.white : AppColors.p3, // neongrønn
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}