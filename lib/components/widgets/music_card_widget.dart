import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/views/home_page/meditate/audio_file.dart';

Widget musicCardWidget({
  required height,
  required width,
  required imgAsset,
  required title,
  required author,
  required advancedPlayer,
  required audioCache,
  required musicPath,
}) {
  return Column(
    children: [
      const Spacer(
        flex: 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: height,
          width: width,
          child: SvgPicture.asset(
            imgAsset,
          ),
        ),
      ),
      const Spacer(
        flex: 4,
      ),
      Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[700],
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[500],
              letterSpacing: 0.5,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
      const Spacer(
        flex: 2,
      ),
      AudioFilePage(
        musicPath: musicPath,
        advancePlayer: advancedPlayer,
        audioCache: audioCache,
      ),
      const Spacer(
        flex: 3,
      ),
    ],
  );
}
