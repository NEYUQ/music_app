import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/base/SizeUlti.dart';
import 'package:music_app/base/components/text_components.dart';
import 'package:music_app/dash_board/dash_board_controller.dart';
import 'package:music_app/home/home_page.dart';
import 'package:music_app/utils/color_app.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: const Drawer(),
      body: _body(),
      bottomSheet: GestureDetector(
        onTap: () {
          // Show screen bottom sheet.
          showScreenBottomSheet(context);
        },
        child: Container(
          color: ColorApp.PRIMARY_COLOR,
          height: SizeUtil.getMaxHeight() * 0.11,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Slider.
              _slider(),
              Expanded(
                child: Row(
                  children: [
                    // Image song.
                    _imageSong(),
                    // Name song and singer.
                    _nameSong(),
                    // Icon controller audio.
                    _iconsPlayingAudio(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// Slider.
  ///
  Widget _slider() {
    return Obx(
      () => SliderTheme(
        data: SliderThemeData(
          overlayShape: SliderComponentShape.noThumb,
        ),
        child: Slider(
          value: controller.timeLineAudio.value,
          onChanged: (value) {
            controller.onChangeTimeLineAudio(value);
          },
          activeColor: ColorApp.WHITE,
          inactiveColor: ColorApp.WHITE.withOpacity(.31),
        ),
      ),
    );
  }

  ///
  /// App bar.
  ///
  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorApp.PRIMARY_COLOR,
      elevation: 0,
      actions: [
        Icon(
          Icons.search,
          color: ColorApp.WHITE,
          size: SizeUtil.setSize(percent: 0.04),
        ),
        const SizedBox(
          width: SizeUtil.SPACE_6X,
        ),
      ],
    );
  }

  ///
  /// Name song.
  ///
  Widget _nameSong() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          //
          // Name song.
          TextNameSong(
            nameSong: "Chaff & Dust",
          ),
          // Name singer.
          TextNameSinger(
            nameSinger: "ERIKA RECKONS",
          ),
        ],
      ),
    );
  }

  ///
  /// Image song.
  ///
  Widget _imageSong() {
    return SizedBox(
      height: SizeUtil.getMaxHeight() * 0.08,
      width: SizeUtil.getMaxHeight() * 0.08,
      child: Image.network(
        "https://d1j8r0kxyu9tj8.cloudfront.net/images/1566809317niNpzY2khA3tzMg.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  ///
  /// Icon playing audio.
  ///
  Widget _iconsPlayingAudio({double? size}) {
    return Row(
      children: [
        Icon(
          Icons.skip_previous_outlined,
          color: ColorApp.WHITE,
          size: size ?? SizeUtil.setSize(percent: 0.05),
        ),
        Icon(
          Icons.pause,
          color: ColorApp.WHITE,
          size: size ?? SizeUtil.setSize(percent: 0.05),
        ),
        Icon(
          Icons.skip_next_outlined,
          color: ColorApp.WHITE,
          size: size ?? SizeUtil.setSize(percent: 0.05),
        ),
      ],
    );
  }

  ///
  /// Body of page.
  ///
  Widget _body() {
    return Column(
      children: [
        const Expanded(
          child: HomePage(),
        ),
        SizedBox(
          height: SizeUtil.getMaxHeight() * 0.1,
        ),
      ],
    );
  }

  ///
  /// Show Screen bottom sheet.
  ///
  Future<void> showScreenBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Container(
          height: SizeUtil.getMaxHeight(),
          color: ColorApp.PRIMARY_COLOR,
          child: Scaffold(
            backgroundColor: ColorApp.PRIMARY_COLOR,
            appBar: _appBarBottomSheet(),
            body: Column(
              children: [
                const SizedBox(
                  height: SizeUtil.SPACE_6X,
                ),
                // Slider bottom sheet.
                _sliderBottomSheet(),
                const SizedBox(
                  height: SizeUtil.SPACE_4X,
                ),
                // Name song singer and favorite.
                _nameSongSingerFavorite(),
                const SizedBox(
                  height: SizeUtil.SPACE_4X,
                ),
                Padding(
                  padding: SizeUtil.setEdgeInsetsSymmetric(
                    horizontal: SizeUtil.SPACE_1X,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.volume_down_outlined,
                        color: const Color(0xff8996B8).withOpacity(.6),
                        size: 30,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.restore,
                        color: const Color(0xff8996B8).withOpacity(.6),
                        size: 30,
                      ),
                      const SizedBox(
                        width: SizeUtil.SPACE_1X,
                      ),
                      Icon(
                        Icons.shuffle,
                        color: const Color(0xff8996B8).withOpacity(.6),
                        size: 30,
                      ),
                      const SizedBox(
                        width: SizeUtil.SPACE_1X,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///
  /// Name song singer and favorite.
  ///
  Widget _nameSongSingerFavorite() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: const [
                TextNameSong(
                  nameSong: "Moment Apart",
                ),
                SizedBox(
                  height: SizeUtil.SPACE_1X,
                ),
                TextNameSinger(
                  nameSinger: "ODEZA",
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: SizeUtil.SPACE_5X,
          top: SizeUtil.SPACE_1X,
          child: Icon(
            Icons.favorite_border,
            color: ColorApp.FAVORITE_COLOR_BORDER,
          ),
        ),
      ],
    );
  }

  ///
  /// Slider bottom sheet.
  ///
  Widget _sliderBottomSheet() {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: SizeUtil.setBorderRadiusAll(
            radius: SizeUtil.RADIUS_2X,
          ),
          child: Image.network(
            "https://pic.pikbest.com/02/21/48/50g888piCRIK.jpg!bw700",
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        viewportFraction: 0.7,
        enlargeCenterPage: true,
        height: SizeUtil.setSize(percent: 0.33),
        onPageChanged: (index, reason) {},
      ),
    );
  }

  AppBar _appBarBottomSheet() {
    return AppBar(
      backgroundColor: ColorApp.PRIMARY_COLOR,
      elevation: 0,
      title: Text(
        "Playing now",
        style: TextStyle(
          color: ColorApp.WHITE,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
    );
  }
}
