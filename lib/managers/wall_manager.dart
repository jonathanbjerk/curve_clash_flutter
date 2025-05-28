
import 'package:flame/components.dart';
import 'package:vector_math/vector_math_64.dart' as vm;
import 'package:curve_clash_flutter/components/wall.dart';
import 'package:curve_clash_flutter/curve_clash_game.dart';

class WallManager extends Component with HasGameRef<CurveClashGame> {
  final List<Wall> walls = [];
  bool wallsCreated = false;

  @override
  void update(double dt) {
    if (!wallsCreated && gameRef.size.x > 0 && gameRef.size.y > 0) {
      _createWalls();
      wallsCreated = true;
    }
  }

  void _createWalls() {
    final size = gameRef.size;
    final topLeft = vm.Vector2.zero();
    final bottomRight = vm.Vector2(size.x, size.y);

    walls.add(Wall(from: vm.Vector2(0, 0), to: vm.Vector2(0, size.y))); // Venstre
    walls.add(Wall(from: vm.Vector2(size.x, 0), to: bottomRight));     // Høyre
    walls.add(Wall(from: vm.Vector2(0, 0), to: vm.Vector2(size.x, 0))); // Topp
    walls.add(Wall(from: vm.Vector2(0, size.y), to: bottomRight));     // Bunn

    print("🧱 Walls created: ${walls.length}");
  }

  bool collidesWith(vm.Vector2 point, {double margin = 2.5}) {
    for (final wall in walls) {
      final d = wall.distanceToPoint(point);
      if (d <= margin) {
        print("🟥 Wall collision at $point (dist $d)");
        return true;
      }
    }
    return false;
  }
}
