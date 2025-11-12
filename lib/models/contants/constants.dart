import 'package:flutter/material.dart';

final kElevatedbtnprimary = ElevatedButton.styleFrom(
  primary: const Color(0xffFF9E44),
  onPrimary: Colors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
);

const kBtnPrimary = Color(0xffFF9E44);

const kTitle = TextStyle(
  fontSize: 18.0,
  letterSpacing: 1.0,
  fontWeight: FontWeight.bold,
);
const kDesc = TextStyle(fontSize: 14.0, letterSpacing: 1.0);
const kBtnFnt = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.3);
