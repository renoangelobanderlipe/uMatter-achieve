import 'package:flutter/material.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/game_page.dart';

Widget resultWidget({
  required score,
  required size,
  required context,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        // Titlte
        Text(
          'Congratulations you got',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.grey[600],
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        // Quiz result
        Container(
          padding: const EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Text(
            "${double.parse(score).round()}",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: size.height * 0.08,
          width: double.infinity,
          child: ElevatedButton(
            style: kElevatedbtnprimary,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const GamePage(),
                ),
                (route) => false),
            child: const Text('Continue'),
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}
