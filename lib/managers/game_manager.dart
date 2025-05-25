import 'package:flame/components.dart';

class GameManager extends Component {
  bool isGameOver = false;

  void gameOver() {
    isGameOver = true;
  }

  void reset() {
    isGameOver = false;
  }
}