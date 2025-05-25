import 'package:flame/components.dart';

class ScoreManager extends Component {
  int player1Score = 0;
  int player2Score = 0;

  void reset() {
    player1Score = 0;
    player2Score = 0;
  }

  void increaseScore(int playerId) {
    if (playerId == 1) {
      player1Score++;
    } else if (playerId == 2) {
      player2Score++;
    }
  }

  @override
  void update(double dt) {
    // Score logic if needed
  }
}