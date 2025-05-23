import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'curve_clash_game.dart';

void main() => runApp(const CurveClashApp());

class CurveClashApp extends StatelessWidget {
  const CurveClashApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
      );
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/starfield.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/curve_clash_logo_offisiell.png', width: 260),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  foregroundColor: const Color(0xFFFF66CC),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  final game = CurveClashGame();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        body: GameWidget<CurveClashGame>(
                          game: game,
                          overlayBuilderMap: {
                            'gameOver': (_, __) => Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFF1A1A2E),
                                      foregroundColor:
                                          const Color(0xFFFF66CC),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 20),
                                    ),
                                    onPressed: game.newRound,
                                    child: const Text('NY RUNDE',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                          },
                        ),
                      ),
                    ),
                  );
                },
                child: const Text('START'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
