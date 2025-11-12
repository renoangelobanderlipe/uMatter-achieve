import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget musicCardListWidget({
  required title,
  required author,
  required size,
  required context,
  required controller,
  required index,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
    ),
      child: SizedBox(
        height: size.height * 0.12,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Title
                  SizedBox(
                    // color: Colors.orange,
                    width: size.width / 2.3,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey[200],
                ),
                child: SvgPicture.asset(
                  'assets/img/music_therapy/music_track.svg',
                  height: 50.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
