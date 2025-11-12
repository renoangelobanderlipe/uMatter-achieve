import 'package:flutter/material.dart';

Widget settingsCardWidget({
  required title,
  required icon,
  required cardHeight,
  required context,
  // required action,
}) {
  return SizedBox(
    height: cardHeight,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey[300],
              ),
              child: Icon(icon),
            ),
            const SizedBox(
              width: 30.0,
            ),
            Text(
              title,
              style: const TextStyle(letterSpacing: 0.5),
            ),
          ],
        ),
      ],
    ),
  );
}
