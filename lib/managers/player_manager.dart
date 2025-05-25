import 'dart:math';
import 'package:flame/components.dart';
import '../curve_clash_game.dart';
import '../components/snake.dart';

class PlayerManager extends Component {
  Vector2? lastStartPosition;
  final CurveClashGame game;

  PlayerManager(this.game);

  void removePlayers() {
    children.whereType<Snake>().forEach(remove);
  }

  void spawnPlayers() {
    final margin = 50.0;
    final rand = Random();
    lastStartPosition = Vector2(
      margin + rand.nextDouble() * (game.size.x - 2 * margin),
      margin + rand.nextDouble() * (game.size.y - 2 * margin),
    );
    final angle = rand.nextDouble() * 2 * pi;

    print("🧪 Spawner slange på: $lastStartPosition med vinkel $angle");

    final snake = Snake(startPosition: lastStartPosition!, initialAngle: angle);
    add(snake);
  }

  void activateAllSnakes() {
    for (final snake in children.whereType<Snake>()) {
      snake.active = true;
    }
  }
}