import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/controllers/home_page_controller/homepage_controller.dart';
import 'package:umatter/preferences/consts.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/get_user_information_page/get_user_data_page.dart';

import '../../preferences/run_preferences.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  State<AssessmentPage> createState() => AssessmentPageState();
}

class AssessmentPageState extends State<AssessmentPage> {
  final homeController = HomePageController();
  final keyOne = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _runPreferences = RunPreferences();
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: homeController.homepageController[0].color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
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
                        color: Colors.grey[300],
                      ),
                      height: size.height * 0.19,
                      width: size.width * 0.24,
                      child: SvgPicture.asset(
                          homeController.homepageController[0].img),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeController.homepageController[0].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                          child: Text(
                            homeController.homepageController[0].subtitle,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
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
                    onPressed: () async {
                      bool firstAssessment =
                          await _runPreferences.getFirstRun(assessmentRunKey);
                      if (firstAssessment) {
                        // runPreferences.disableFirstRun(assessmentRunKey);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const UserInfoPage(),
                            // builder: (context) => const WelcomePage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  homeController.homepageController[0].route),
                        );
                      }
                    },
                    child: const Text(
                      'Continue',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
