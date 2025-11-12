import 'package:flutter/material.dart';

Widget closeButtonWidget({required context}) {
  return Align(
    alignment: Alignment.topRight,
    child: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Icon(
          Icons.close_rounded,
          color: Colors.grey[200],
        ),
      ),
    ),
  );
}
