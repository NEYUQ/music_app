import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class DashBoardController extends GetxController {
  RxBool isPlaying = false.obs;
  final player = AudioPlayer();
  Duration duration = const Duration();
  Duration position = Duration.zero;
  @override
  void onInit() {
    super.onInit();
    initValue();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    isPlaying.close();
  }
  ///
  /// Init value.
  ///
  Future<void> initValue() async {
    player.setAsset('assets/audio/nang_ougest.mp3').then((value) {
      if (value != null) {
        duration = value;
        isPlaying.value = true;
        player.play();

        // Declare a stream of audio.
        player.positionStream.listen((event) {
          if (position < duration) {
            position = position + const Duration(milliseconds: 200);
            update(['ID_SLIDER_AUDIO']);
          } else {
            isPlaying.value = false;
            player.pause();
          }
        });
      }
    });
  }

  ///
  /// On change timeLine audio.
  ///
  void onChangeTimeLineAudio(double value) {
    position = Duration(seconds: value.toInt());
    player.seek(position);
    update(['ID_SLIDER_AUDIO']);
  }

  ///
  /// Duration audio.
  ///
  String audioDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }

  ///
  /// Handle play or pause audio.
  ///
  void handlePlayOrPauseAudio() {
    if (player.playing) {
      isPlaying.value = false;
      player.pause();
    } else {
      // if end music.
      if (position > duration) {
        position = Duration.zero;
        player.seek(position);
        update(['ID_SLIDER_AUDIO']);
      }
      isPlaying.value = true;
      player.play();
    }
  }
}
