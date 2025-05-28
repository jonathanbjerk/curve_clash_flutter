
import 'package:flame_audio/flame_audio.dart';

enum SfxType {
  click,
  count,
  go,
}

class AudioManager {
  static const _sfxPaths = {
    SfxType.click: 'sfx/click.wav',
    SfxType.count: 'sfx/count.wav',
    SfxType.go: 'sfx/go.wav',
  };

  static void play(SfxType type) {
    final file = _sfxPaths[type];
    if (file != null) {
      FlameAudio.play(file);
    } else {
      print('⚠️ Unknown SFX type: $type');
    }
  }
}
