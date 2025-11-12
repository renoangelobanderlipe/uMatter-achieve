import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/utils/colors.dart';

import '../../../../controllers/reach_out_controller/campus_controller.dart';
import '../../../../controllers/reach_out_controller/campus_profile_controller.dart';
import 'campus_profile_page/campus_professional_profile_page.dart';

class CampusProfessionalPage extends StatefulWidget {
  const CampusProfessionalPage({Key? key}) : super(key: key);

  @override
  State<CampusProfessionalPage> createState() => _CampusProfessionalPageState();
}

class _CampusProfessionalPageState extends State<CampusProfessionalPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Counselor',
            style: kAppBarTitle,
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[400],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close,
                color: Colors.grey[400],
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
        ),
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: campusInfoPage.length,
                  itemBuilder: (context, index) => homeDiscoverCardWidget(
                    title: campusInfoPage[index].title,
                    subtitle: campusInfoPage[index].subtitle,
                    btnColor: kbtnColor,
                    logo: campusInfoPage[index].imgAsset,
                    bgLogo: Colors.grey[100],
                    cardColor: campusInfoPage[index].color,
                    context: context,
                    size: size,
                    controller: campusProfileController,
                    index: index,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget homeDiscoverCardWidget({
  required title,
  required subtitle,
  required btnColor,
  required logo,
  required bgLogo,
  required cardColor,
  required context,
  required size,
  required controller,
  required index,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgLogo,
                  ),
                  height: size.height * 0.16,
                  width: size.width * 0.24,
                  child: Image.asset(logo),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[400],
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kbtnColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CampusProfessionalProfilePage(
                      controller: controller,
                      index: index,
                    ),
                  ),
                ),
                child: const Text(
                  'Continue',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
