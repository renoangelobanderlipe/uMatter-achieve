import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/meditate_page_controller/acoustic_controller.dart';
import 'package:umatter/views/home_page/meditate/acoustic_guitar_page/acoustic_view_page.dart';
import 'package:umatter/views/home_page/meditate/music_card_list_widget.dart';

class AcousticGuitarPage extends StatefulWidget {
  const AcousticGuitarPage({Key? key}) : super(key: key);

  @override
  State<AcousticGuitarPage> createState() => _AcousticGuitarPageState();
}

class _AcousticGuitarPageState extends State<AcousticGuitarPage> {
  final controller = AcousticPageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Acoustic Music',
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
            itemCount: controller.acousticPageController.length,
            itemBuilder: (context, index) {
              return TextButton(
                style:
                    TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcousticViewPage(
                      controller: controller.acousticPageController,
                      index: index,
                    ),
                  ),
                ),
                child: musicCardListWidget(
                  title: controller.acousticPageController[index].title,
                  author: controller.acousticPageController[index].authorName,
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
