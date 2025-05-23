import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'curve_clash_game.dart';

void main() {
  runApp(const CurveClashApp());
}

class CurveClashApp extends StatelessWidget {
  const CurveClashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [
            Color(0xFF0F0F1A),
            Color(0xFF1F1F3A),
            Color(0xFF2F2F5A),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset('assets/curve_clash_logo_offisiell.png'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => GameWidget(game: CurveClashGame()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A2E),
                foregroundColor: const Color(0xFFFF66CC),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 15,
                      color: Colors.blueAccent,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                elevation: 12,
              ),
              child: const Text('START'),
            ),
          ],
        ),
      ),
    );
  }
}
