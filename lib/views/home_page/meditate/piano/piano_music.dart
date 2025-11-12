import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/meditate_page_controller/piano_controller.dart';
import 'package:umatter/views/home_page/meditate/music_card_list_widget.dart';
import 'package:umatter/views/home_page/meditate/piano/piano_page.dart';

class PianoMusicPage extends StatelessWidget {
  const PianoMusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final controller = PianoPageController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
          color: Colors.grey[600],
        ),
        title: Text(
          'Lofi',
          style: kAppBarTitle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          itemCount: controller.pianoPageInfo.length,
          itemBuilder: (context, index) {
            return TextButton(
              style:
                  TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PianoPage(
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
          }),
    );
  }
}
