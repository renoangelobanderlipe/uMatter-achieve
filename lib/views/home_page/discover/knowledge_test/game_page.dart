import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/game_page_controller.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/multiple_choice/multiple_choice_controller.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/true_false/trueorfalse_controller.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

import '../../../../components/back_button.dart';
import '../../../../controllers/shared_pref_controller/shared_pref_controller.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    String trueorfalseScore = (SharePrefConfig.getTrueofFalse() ?? "0");
    String multiplechoiceScore = (SharePrefConfig.getMultipleChoice() ?? "0");

    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Knowledge Test',
            style: kAppBarTitle,
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NavBarPage())),
            icon: kbackButton,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              // Text('True or False Score : ${trueorfalseScore}'),
              // Text('True or False Len: ${trueorfalseController.length}'),
              // Text('True or False Score : ${multiplechoiceScore}'),
              // Text('True or False Len: ${multiplechoiceController.length}'),

              knowledgeTestWidget(
                title: gamepageController[0].title,
                subtitle: gamepageController[0].subtitle,
                btnColor: kbtnColor,
                score: trueorfalseScore,
                bgScore: Colors.grey[300],
                cardColor: gamepageController[0].cardColor,
                questionLen: trueorfalseController.length,
                context: context,
                size: size,
                route: gamepageController[0].route,
              ),
              const SizedBox(
                height: 30.0,
              ),
              knowledgeTestWidget(
                title: gamepageController[1].title,
                subtitle: gamepageController[1].subtitle,
                btnColor: kbtnColor,
                score: multiplechoiceScore,
                bgScore: Colors.grey[300],
                cardColor: gamepageController[1].cardColor,
                questionLen: multiplechoiceController.length,
                context: context,
                size: size,
                route: gamepageController[1].route,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget knowledgeTestWidget({
  required title,
  required subtitle,
  required btnColor,
  required score,
  required bgScore,
  required cardColor,
  required questionLen,
  required context,
  required size,
  required route,
}) {
  return Container(
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Column(
        children: [
          // Text('${score.runtimeType}'),
          // Text('${double.parse(score).runtimeType}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.19,
                width: size.width * 0.24,
                child: CircularPercentIndicator(
                  animateFromLastPercent: true,
                  radius: 50.0,
                  // percent: score / questionLen,
                  percent: double.parse(score) / questionLen,
                  center: Text("${double.parse(score).round()} / $questionLen"),
                  animation: true,
                  animationDuration: 1000,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "${questionLen.runtimeType}",
                    title,
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
                      subtitle,
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
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => route),
              ),
              child: const Text(
                'Continue',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
