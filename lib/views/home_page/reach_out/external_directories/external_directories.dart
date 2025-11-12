import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/views/home_page/settings_page/settings_label_widget.dart';

import '../../../../controllers/reach_out_controller/external_directories_controller.dart';
import 'external_directories_widget.dart';

class ExternalDirectoriesPage extends StatefulWidget {
  const ExternalDirectoriesPage({Key? key}) : super(key: key);
  @override
  _ExternalDirectoriesPageState createState() =>
      _ExternalDirectoriesPageState();
}

class _ExternalDirectoriesPageState extends State<ExternalDirectoriesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DOH Hotlines', style: kAppBarTitle),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.chevron_left, color: Colors.grey[600]),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              settingsLabelWidget(
                title: "Landline",
                width: 0.0,
                height: 0.0,
                fontSize: 20.0,
                fontColor: Colors.grey[700],
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
              const SizedBox(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.all(0.0)),
                onPressed: () => launchPhoneCall(
                    'tel: ${externaldirectoriesController[0].title}'),
                child: externaldirectoriesWidget(
                  title: externaldirectoriesController[0].title,
                  cardColor: Colors.grey[100],
                  icon: FaIcon(
                    FontAwesomeIcons.phone,
                    color: Colors.grey[600],
                  ),
                  size: size,
                  context: context,
                ),
              ),
              const SizedBox(height: 30.0),
              settingsLabelWidget(
                title: "Globe and TM",
                width: 0.0,
                height: 0.0,
                fontSize: 20.0,
                fontColor: Colors.grey[700],
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
              const SizedBox(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.all(0.0)),
                onPressed: () => launchPhoneCall(
                    'tel: ${externaldirectoriesController[1].title}'),
                child: externaldirectoriesWidget(
                  title: externaldirectoriesController[1].title,
                  cardColor: Colors.grey[100],
                  icon: FaIcon(
                    FontAwesomeIcons.mobile,
                    color: Colors.grey[600],
                  ),
                  size: size,
                  context: context,
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.all(0.0)),
                onPressed: () => launchPhoneCall(
                    'tel: ${externaldirectoriesController[2].title}'),
                child: externaldirectoriesWidget(
                  title: externaldirectoriesController[2].title,
                  cardColor: Colors.grey[100],
                  icon: FaIcon(
                    FontAwesomeIcons.mobile,
                    color: Colors.grey[600],
                  ),
                  size: size,
                  context: context,
                ),
              ),
              const SizedBox(height: 30.0),
              settingsLabelWidget(
                title: "Smart, Sun and TNT",
                width: 0.0,
                height: 0.0,
                fontSize: 20.0,
                fontColor: Colors.grey[700],
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
              const SizedBox(height: 10.0),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.all(0.0)),
                onPressed: () => launchPhoneCall(
                    'tel: ${externaldirectoriesController[3].title}'),
                child: externaldirectoriesWidget(
                  title: externaldirectoriesController[3].title,
                  cardColor: Colors.grey[100],
                  icon: FaIcon(
                    FontAwesomeIcons.mobile,
                    color: Colors.grey[600],
                  ),
                  size: size,
                  context: context,
                ),
              ),
              const SizedBox(height: 30.0),
              settingsLabelWidget(
                title: "Social Networks",
                width: 0.0,
                height: 0.0,
                fontSize: 20.0,
                fontColor: Colors.grey[700],
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
              const SizedBox(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.all(0.0)),
                onPressed: () =>
                    launchUrl('https://www.facebook.com/ncmhcrisishotline/'),
                child: externaldirectoriesWidget(
                  title: externaldirectoriesController[4].title,
                  cardColor: Colors.grey[100],
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.grey[600],
                  ),
                  size: size,
                  context: context,
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.all(0.0)),
                onPressed: () => launchUrl('https://twitter.com/ncmhhotline'),
                child: externaldirectoriesWidget(
                  title: externaldirectoriesController[5].title,
                  cardColor: Colors.grey[100],
                  icon: FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.grey[600],
                  ),
                  size: size,
                  context: context,
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.all(0.0)),
                onPressed: () =>
                    launchUrl('https://doh.gov.ph/NCMH-Crisis-Hotline'),
                child: externaldirectoriesWidget(
                  title: "NCMH Crisis Hotline",
                  cardColor: Colors.grey[100],
                  icon: FaIcon(
                    FontAwesomeIcons.link,
                    color: Colors.grey[600],
                  ),
                  size: size,
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
