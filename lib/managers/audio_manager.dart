import 'package:flame_audio/flame_audio.dart';

class AudioManager {
  static final AudioManager instance = AudioManager._internal();
  AudioManager._internal();

  Future<void> play(String file) async {
    await FlameAudio.play('sfx/$file'); // 🔧 fjernet "audio/" prefix
  }

  Future<void> initialize() async {
    await FlameAudio.bgm.initialize();
  }
}