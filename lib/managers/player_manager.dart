import 'package:flame/components.dart';
import 'package:curve_clash_flutter/components/player/player_component.dart';
import 'package:curve_clash_flutter/config/colors.dart';
import 'package:vector_math/vector_math_64.dart';

class PlayerManager extends Component {
  final List<PlayerComponent> players = [];

  @override
  Future<void> onLoad() async {
    players.addAll([
      PlayerComponent(
        name: 'Player 1',
        color: AppColors.player1,
        startPosition: Vector2(100, 100),
        startAngle: 0,
      ),
      PlayerComponent(
        name: 'Player 2',
        color: AppColors.player2,
        startPosition: Vector2(300, 300),
        startAngle: 3.14,
      ),
    ]);

    addAll(players);
  }

  void resetPlayers() {
    for (final player in players) {
      player.reset();
    }
  }
}