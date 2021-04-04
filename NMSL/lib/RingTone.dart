import 'package:audioplayers/audioplayers.dart';

class MusicPlayer{
  AudioPlayer audioPlayer = AudioPlayer();
  play(url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
    }
  }
}