import 'package:get/get.dart';
import 'package:music_app/routers/path_routers/home_routers.dart';

class AppRouters {
  static List<GetPage> list = [
    ...HomeRouters.list,
  ];
}
