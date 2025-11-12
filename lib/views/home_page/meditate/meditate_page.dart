import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/meditate_page_controller/meditate_controller.dart';

import '../../../components/widgets/meditate_card_widget.dart';

class MeditatePage extends StatefulWidget {
  const MeditatePage({Key? key}) : super(key: key);

  @override
  State<MeditatePage> createState() => _MeditatePageState();
}

class _MeditatePageState extends State<MeditatePage> {
  final _meditatePageController = MeditatePageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.chevron_left, color: Colors.grey[600]),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'U-Tunes',
              style: kAppBarTitle,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                meditateCardWidget(
                  title:
                      _meditatePageController.meditatePageController[0].title,
                  subtitle: _meditatePageController
                      .meditatePageController[0].subtitle,
                  context: context,
                  route:
                      _meditatePageController.meditatePageController[0].route,
                ),
                meditateCardWidget(
                  title:
                      _meditatePageController.meditatePageController[1].title,
                  subtitle: _meditatePageController
                      .meditatePageController[1].subtitle,
                  context: context,
                  route:
                      _meditatePageController.meditatePageController[1].route,
                ),
                meditateCardWidget(
                  title:
                      _meditatePageController.meditatePageController[2].title,
                  subtitle: _meditatePageController
                      .meditatePageController[2].subtitle,
                  context: context,
                  route:
                      _meditatePageController.meditatePageController[2].route,
                ),
                meditateCardWidget(
                  title:
                      _meditatePageController.meditatePageController[3].title,
                  subtitle: _meditatePageController
                      .meditatePageController[3].subtitle,
                  context: context,
                  route:
                      _meditatePageController.meditatePageController[3].route,
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          )),
    );
  }
}
