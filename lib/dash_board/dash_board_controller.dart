import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/model/audio_model/audio_model.dart';

class DashBoardController extends GetxController {
  // 
  // Declare variables.
  RxBool isPlaying = false.obs;
  AudioPlayer player = AudioPlayer();
  Duration duration = const Duration();
  Duration position = Duration.zero;
  RxBool isHasMusic = false.obs;
  AudioModel? audioModel;
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
    isHasMusic.close();
  }

  ///
  /// Init value.
  ///
  Future<void> initValue({String? url, AudioModel? audio}) async {
    if (url != null && audio != null) {
      isHasMusic.value = true;
      player.dispose();
      player = AudioPlayer();
      audioModel = audio;
      update(['ID_ALL_MUSIC']);
      player.setAsset(url).then((value) {
        if (value != null) {
          position = Duration.zero;
          duration = value;
          isPlaying.value = true;
          player.play();

          // Declare a stream listen value of audio.
          late StreamSubscription<Duration> subscriptionPosition;
          subscriptionPosition = player.positionStream.listen((event) {
            if (position < duration) {
              position = position + const Duration(milliseconds: 200);
              update(['ID_SLIDER_AUDIO']);
            } else {
              isPlaying.value = false;
              player.pause();
              subscriptionPosition.cancel();
            }
          });

          // Update when duration change.
          player.durationStream.listen((event) {
            if (event != null) {
              duration = event;
              update(['ID_SLIDER_AUDIO']);
            }
          });
        }
      });
    }
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
