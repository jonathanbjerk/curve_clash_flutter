import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Wall extends PositionComponent with CollisionCallbacks {
  Wall({required Vector2 position, required Vector2 size}) {
    this.position = position;
    this.size = size;
    anchor = Anchor.topLeft;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox()); // gjør det kolliderbart
  }
}