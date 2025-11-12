import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

Widget meditateCardWidget({
  required title,
  required subtitle,
  required context,
  required route,
}) =>
    Card(
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.left,
              // textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryFrmColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => route)),
                child: const Text('Check it out!'),
              ),
            ),
          ],
        ),
      ),
    );
