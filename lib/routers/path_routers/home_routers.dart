import 'package:get/get.dart';
import 'package:music_app/dash_board/dash_board_page.dart';
import 'package:music_app/home/home_binding.dart';
import 'package:music_app/home/home_page.dart';

import '../../dash_board/dash_board_binding.dart';

class HomeRouters {
  static String HOME = '/HOME';
  static String DASH_BOARD = '/DASH_BOARD';
  static List<GetPage> list = [
    GetPage(
      name: HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: DASH_BOARD,
      page: () => const DashBoardPage(),
      binding: DashBoardBinding(),
    ),
  ];
}
