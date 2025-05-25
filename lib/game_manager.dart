import 'package:flame/components.dart';

class GameManager extends Component {
  final void Function()? onGameOver;

  GameManager({this.onGameOver});

  void reset() {
    // nullstill game state om nødvendig
  }
}
