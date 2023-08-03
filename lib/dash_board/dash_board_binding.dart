import 'package:get/get.dart';
import 'package:music_app/dash_board/dash_board_controller.dart';
import 'package:music_app/home/home_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.put<HomeController>(HomeController());
  }
}
