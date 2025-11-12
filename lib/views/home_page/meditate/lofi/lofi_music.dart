import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/meditate_page_controller/lofi_controller.dart';
import 'package:umatter/views/home_page/meditate/lofi/lofi_page.dart';
import 'package:umatter/views/home_page/meditate/music_card_list_widget.dart';

class LofiMusicPage extends StatelessWidget {
  const LofiMusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final controller = LofiPageController();
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
          itemCount: controller.lofiPageInfo.length,
          itemBuilder: (context, index) {
            return TextButton(
              style:
                  TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LofiPage(
                    controller: controller.lofiPageInfo,
                    index: index,
                  ),
                ),
              ),
              child: musicCardListWidget(
                title: controller.lofiPageInfo[index].title,
                author: controller.lofiPageInfo[index].authorName,
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
