import 'package:flutter/material.dart';

Widget settingsPageWidget({
  required height,
  required icon,
  required title,
  required navIcon,
  required cardColor,
  required route,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
    child: ElevatedButton(
      onPressed: () => route,
      style: ElevatedButton.styleFrom(
        primary: cardColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 30.0,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Icon(navIcon),
          ],
        ),
      ),
    ),
  );
}
