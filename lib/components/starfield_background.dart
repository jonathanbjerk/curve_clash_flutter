import 'package:flame/components.dart';

class StarfieldBackground extends SpriteComponent {
  StarfieldBackground() : super(priority: -1);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('images/starfield.png');
    size = Vector2.all(1000); // adjust if needed
  }
}