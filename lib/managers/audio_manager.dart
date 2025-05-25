// lib/managers/audio_manager.dart

import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _player = AudioPlayer();

  Future<void> play(String fileName) async {
    final filePath = 'assets/audio/sfx/$fileName';
    await _player.play(AssetSource(filePath));
  }
}