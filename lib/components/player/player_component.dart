import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:curve_clash_flutter/components/snake.dart';

class PlayerComponent extends Component {
  final String name;
  final Color color;
  final LogicalKeyboardKey leftKey;
  final LogicalKeyboardKey rightKey;
  final Vector2 startPosition;
  final double startAngle;

  late final Snake snake;
  int score = 0;

  PlayerComponent({
    required this.name,
    required this.color,
    required this.leftKey,
    required this.rightKey,
    required this.startPosition,
    required this.startAngle,
  }) {
    snake = Snake(
      color: color,
      startPosition: startPosition,
      startAngle: startAngle,
    );
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(snake);
  }

  void reset() {
    snake.reset(startPosition, startAngle);
  }
}