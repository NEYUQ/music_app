import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/base/SizeUlti.dart';
import 'package:music_app/home/home_controller.dart';
import 'package:music_app/utils/color_app.dart';

import '../base/components/text_components.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: SizeUtil.setEdgeInsetsSymmetric(
            horizontal: SizeUtil.SPACE_3X,
            vertical: SizeUtil.SPACE_2X,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                // Item recommended of page.
                _itemInPage(
                  title: "Recommended for you",
                ),
                const SizedBox(
                  height: SizeUtil.SPACE_5X,
                ),
                // Item playlist of page.
                _itemInPage(
                  title: "My Playlist",
                  isPlaylist: true,
                ),
              ],
            ),
          ),
        ),
      ),
     
    );
  }

  ///
  /// Item in page.
  ///
  Widget _itemInPage({
    required String title,
    bool isPlaylist = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorApp.WHITE,
            fontSize: SizeUtil.BIG_FONT_SIZE,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: SizeUtil.SPACE_3X,
        ),
        SizedBox(
          height: isPlaylist
              ? SizeUtil.getMaxHeight() * 0.36
              : SizeUtil.getMaxHeight() * 0.38,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: SizeUtil.getMaxWidth() * 0.55,
                margin: SizeUtil.setEdgeInsetsOnly(
                  right: SizeUtil.SPACE_2X,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: SizeUtil.getMaxWidth() * 0.55,
                      height: SizeUtil.getMaxHeight() * 0.3,
                      child: ClipRRect(
                        borderRadius: SizeUtil.setBorderRadiusAll(
                          radius: SizeUtil.RADIUS_2X,
                        ),
                        child: Image.network(
                          "https://d1j8r0kxyu9tj8.cloudfront.net/images/1566809317niNpzY2khA3tzMg.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SizeUtil.SPACE_3X,
                    ),
                    if (isPlaylist)
                      // Widget name song.
                      const TextNameSong(
                        nameSong: "Monsters Go Bump",
                      )
                    else
                      Column(
                        children:const [
                          // Widget name song.
                          TextNameSong(
                            nameSong: "Monsters Go Bump",
                          ),
                          SizedBox(
                            height: SizeUtil.SPACE_1X,
                          ),
                          // Name actor.
                          TextNameSinger(nameSinger: "ERIKA RECKONS"),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}
