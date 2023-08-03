import 'package:flutter/material.dart';
import 'package:music_app/base/SizeUlti.dart';

import '../../utils/color_app.dart';
///
/// Text name song.
///
class TextNameSong extends StatelessWidget {
  const TextNameSong({super.key, required this.nameSong});
  final String nameSong;
  @override
  Widget build(BuildContext context) {
    return Text(
      nameSong,
      style: TextStyle(
        color: ColorApp.WHITE,
        fontSize: SizeUtil.LABEL_FONT_SIZE,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
///
/// Text name singer.
///
class TextNameSinger extends StatelessWidget {
  const TextNameSinger({super.key, required this.nameSinger});
  final String nameSinger;
  @override
  Widget build(BuildContext context) {
    return Text(
      nameSinger,
      style: TextStyle(
        color: ColorApp.SUB_TEXT_RECOMMEND,
        fontSize: SizeUtil.BIG_CONTENT_FONT_SIZE,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
