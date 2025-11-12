import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/meditate_page_controller/instrumental_controller.dart';
import 'package:umatter/views/home_page/meditate/instrumental/instrumental_view_page.dart';

import '../music_card_list_widget.dart';

class InstrumentalPage extends StatefulWidget {
  const InstrumentalPage({Key? key}) : super(key: key);

  @override
  State<InstrumentalPage> createState() => _InstrumentalPageState();
}

class _InstrumentalPageState extends State<InstrumentalPage> {
  final controller = InstrumentalPageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instrumental ',
          style: kAppBarTitle,
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[600],
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: controller.instrumentalController.length,
        itemBuilder: (context, index) {
          return TextButton(
            style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InstrumentalViewPage(
                  controller: controller.instrumentalController,
                  index: index,
                ),
              ),
            ),
            child: musicCardListWidget(
              title: controller.instrumentalController[index].title,
              author: controller.instrumentalController[index].authorName,
              size: _size,
              context: context,
              controller: controller,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
