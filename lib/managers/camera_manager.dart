import 'package:flame/components.dart';
import 'package:flame/camera.dart';

class CameraManager extends Component {
  late final PositionComponent anchor;
  int resetCounter = 5; // prøv å re-følge ankeret 5 frames

  Future<void> initialize({
    required CameraComponent camera,
    required Vector2 resolution,
    required Component parent,
  }) async {
    camera.viewport = FixedResolutionViewport(resolution: resolution);
    camera.viewfinder.anchor = Anchor.topLeft;

    anchor = PositionComponent(position: resolution / 2);
    await parent.add(anchor);

    camera.follow(anchor);
  }

  void centerOn(Vector2 position) {
    anchor.position = position.clone();
  }

  void reattach(CameraComponent camera) {
    camera.follow(anchor);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (resetCounter > 0) {
      resetCounter--;
      gameRef.camera.follow(anchor); // tving kamera tilbake til anker
    }
  }
}