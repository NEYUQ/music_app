import 'package:get/get.dart';

class DashBoardController extends GetxController {

  

  RxDouble timeLineAudio = 0.0.obs;

  ///
  /// On change timeLine audio.
  ///
  void onChangeTimeLineAudio(double value) {
    timeLineAudio.value = value;
  }
}
