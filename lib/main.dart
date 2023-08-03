import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/dash_board/dash_board_binding.dart';
import 'package:music_app/routers/app_routers.dart';
import 'package:music_app/routers/path_routers/home_routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        initialRoute: HomeRouters.DASH_BOARD,
        initialBinding: DashBoardBinding(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppRouters.list,
      ),
    );
  }
}
