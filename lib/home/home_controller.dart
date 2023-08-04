import 'package:get/get.dart';
import 'package:music_app/dash_board/dash_board_controller.dart';
import 'package:music_app/data/model/audio_model/audio_model.dart';

class HomeController extends GetxController {
  RxList<AudioModel> listAudioModel = <AudioModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listAudioModel.value = [
      AudioModel(
        nameSong: "Nàng",
        nameSinger: "OgeNus",
        url: "assets/audio/nang_ougest.mp3",
        thumbnail:
            "https://photo-zmp3.zmdcdn.me/avatars/9/f/e/f/9fef202f1a3c495db5e05eb9f39d5695.jpg",
      ),
      AudioModel(
        nameSong: "Lan Man",
        nameSinger: "Roboongz",
        url: "assets/audio/lanMan.mp3",
        thumbnail:
            "https://avatar-ex-swe.nixcdn.com/singer/avatar/2022/12/23/2/a/2/d/1671783806829_600.jpg",
      ),
      AudioModel(
        nameSong: "Tát nước đầu đình",
        nameSinger: "BinZ",
        url: "assets/audio/tatNuocDauDinh.mp3",
        thumbnail: "https://i.ytimg.com/vi/6vGvIqeGxPc/sddefault.jpg",
      ),
    ];
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    listAudioModel.close();
  }

  ///
  /// handle on click music.
  ///
  void handleOnClickMusic(int index, bool isPlaylist) {
    final item = listAudioModel[index];
    if (isPlaylist) {
    } else {
      Get.find<DashBoardController>().initValue(
        url: item.url,
        audio: item,
      );
    }
  }
}
