
import 'package:vector_math/vector_math_64.dart';

class Wall {
  final Vector2 from;
  final Vector2 to;

  Wall({required this.from, required this.to});

  double distanceToPoint(Vector2 point) {
    final line = to - from;
    final lengthSquared = line.length2;

    if (lengthSquared == 0.0) return (point - from).length;

    final t = ((point - from).dot(line)) / lengthSquared;
    final projection = from + line * t.clamp(0.0, 1.0);
    return (point - projection).length;
  }
}
