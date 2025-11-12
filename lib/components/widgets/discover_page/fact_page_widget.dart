// import 'package:flutter/material.dart';

// Widget factPageWidget({
//   required subtitle,
//   required icon,
//   required bgColor,
//   required topRight,
//   required topLeft,
//   required bottomRight,
//   required bottomLeft,
//   required pVertical,
//   required pHorizontal,
// }) {
//   return Align(
//     alignment: Alignment.center,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Container(
//         padding:
//             EdgeInsets.symmetric(horizontal: pHorizontal, vertical: pVertical),
//         child: Text(
//           subtitle,
//           textAlign: TextAlign.justify,
//           style: const TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(topLeft),
//             topRight: Radius.circular(topRight),
//             bottomLeft: Radius.circular(bottomLeft),
//             bottomRight: Radius.circular(bottomRight),
//           ),
//           color: bgColor,
//         ),
//       ),
//     ),
//   );
// }
