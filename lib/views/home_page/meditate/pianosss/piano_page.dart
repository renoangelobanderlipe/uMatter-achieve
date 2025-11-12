import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/meditate_page_controller/piano_controller.dart';
import 'package:umatter/views/home_page/meditate/acoustic_guitar_page/acoustic_view_page.dart';

import '../music_card_list_widget.dart';

// class PianoPage extends StatefulWidget {
//   const PianoPage({Key? key}) : super(key: key);

//   @override
//   State<PianoPage> createState() => _PianoPageState();
// }

// class _PianoPageState extends State<PianoPage> {
//   final controller = PianoPageController();
//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Piano",
//           style: kAppBarTitle,
//         ),
//         leading: IconButton(
//             onPressed: () => Navigator.of(context).pop(),
//             icon: Icon(
//               Icons.chevron_left,
//               color: Colors.grey[600],
//             )),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       body: ListView.builder(
//         itemCount: controller.pianoPageInfo.length,
//         itemBuilder: (context, index) => TextButton(
//           style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PianoViewPage(
//                 controller: controller.pianoPageInfo,
//                 index: index,
//               ),
//             ),
//           ),
//           child: musicCardListWidget(
//             title: controller.pianoPageInfo[index].title,
//             author: controller.pianoPageInfo[index].authorName,
//             size: _size,
//             context: context,
//             controller: controller,
//             index: index,
//           ),
//         ),
//       ),
//     );
//   }
// }

class PianoPage extends StatefulWidget {
  const PianoPage({Key? key}) : super(key: key);

  @override
  State<PianoPage> createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  final controller = PianoPageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Piano',
              style: kAppBarTitle,
            ),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.chevron_left,
                color: Colors.grey[600],
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: ListView.builder(
            itemCount: controller.pianoPageInfo.length,
            itemBuilder: (context, index) {
              return TextButton(
                style:
                    TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcousticViewPage(
                      controller: controller.pianoPageInfo,
                      index: index,
                    ),
                  ),
                ),
                child: musicCardListWidget(
                  title: controller.pianoPageInfo[index].title,
                  author: controller.pianoPageInfo[index].authorName,
                  size: _size,
                  context: context,
                  controller: controller,
                  index: index,
                ),
              );
            },
          ),
          backgroundColor: Colors.grey[100]),
    );
  }
}
