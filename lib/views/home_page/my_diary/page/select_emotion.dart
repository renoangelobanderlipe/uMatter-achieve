import 'package:flutter/material.dart';
import 'package:umatter/components/close_button.dart';
import 'package:umatter/views/home_page/my_diary/page/add_diary.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/my_diary/page/select_emoji_controller.dart';

import '../../../../controllers/shared_pref_controller/shared_pref_controller.dart';

class EmojiSelectorPage extends StatefulWidget {
  const EmojiSelectorPage({Key? key}) : super(key: key);

  @override
  State<EmojiSelectorPage> createState() => _EmojiSelectorPageState();
}

class _EmojiSelectorPageState extends State<EmojiSelectorPage> {
  String emotions = 'Happy';

  List<String> reasonList = SharePrefConfig.getReasons() ?? [];

  final selectEmojiController = SelectEmojiController();
  final pageController = PageController(initialPage: 0);
  setEmotion() {
    return setState(() {
      emotions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: closeButtonWidget(context: context),
            ),
            const Spacer(),
            Text(
              'I am feeling...',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 260,
              // color: Colors.orange,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  if (index == 0) {
                    emotions = "Happy";
                  } else if (index == 1) {
                    emotions = "Crying";
                  } else if (index == 2) {
                    emotions = "Cool";
                  } else if (index == 3) {
                    emotions = "Love";
                  } else if (index == 4) {
                    emotions = "Shock";
                  } else if (index == 5) {
                    emotions = "Sleepy";
                  } else if (index == 6) {
                    emotions = "Thinking";
                  } else if (index == 7) {
                    emotions = "Tired";
                  } else if (index == 8) {
                    emotions = "Lonely";
                  } else if (index == 9) {
                    emotions = "Angry";
                  } else if (index == 10) {
                    emotions = "Blessed";
                  } else if (index == 11) {
                    emotions = "Exhausted";
                  } else if (index == 12) {
                    emotions = "Drooling";
                  }
                  setEmotion();
                },
                children: [
                  Image.asset(
                    selectEmojiController.selectEmojiController[0].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[1].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[2].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[3].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[4].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[5].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[6].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[7].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[8].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[9].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[10].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[11].img,
                  ),
                  Image.asset(
                    selectEmojiController.selectEmojiController[12].img,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              emotions,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  ),
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.grey[800],
                    size: 30.0,
                  ),
                ),
                // const SizedBox(
                //   width: 50.0,
                // ),
                IconButton(
                  onPressed: () => pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                  icon: Icon(
                    Icons.chevron_right,
                    color: Colors.grey[800],
                    size: 30.0,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                margin: const EdgeInsets.all(15.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    primary: kPrimaryFrmColor,
                  ),
                  onPressed: () {
                    SharePrefConfig.setEmoji(emotions);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const AddDiaryPage(),
                      ),
                    );
                  },
                  child: const Text('Set Mood'),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
