import 'package:flame/components.dart';
import '../curve_clash_game.dart';
import 'wall.dart';

class WallManager extends Component with HasGameRef<CurveClashGame> {
  final double thickness = 10.0;

  @override
  void onMount() {
    super.onMount();

    final width = gameRef.size.x;
    final height = gameRef.size.y;

    addAll([
      Wall(position: Vector2(0, 0), size: Vector2(width, thickness)), // topp
      Wall(position: Vector2(0, height - thickness), size: Vector2(width, thickness)), // bunn
      Wall(position: Vector2(0, 0), size: Vector2(thickness, height)), // venstre
      Wall(position: Vector2(width - thickness, 0), size: Vector2(thickness, height)), // høyre
    ]);
  }
}