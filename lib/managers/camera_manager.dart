import 'package:flame/components.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';

class CameraManager extends Component {
  final CurveClashGame game;

  CameraManager(this.game);

  @override
  void onMount() {
    super.onMount();
    game.camera.viewport = FixedResolutionViewport(Vector2(800, 600));
  }
}