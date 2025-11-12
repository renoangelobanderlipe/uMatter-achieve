import 'package:flutter/material.dart';
import 'package:umatter/components/close_button.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/true_false/trueorfalse_result.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/true_false/trueorfalse_controller.dart';

class TrueorFalsePage extends StatefulWidget {
  const TrueorFalsePage({Key? key}) : super(key: key);

  @override
  State<TrueorFalsePage> createState() => _TrueorFalsePageState();
}

class _TrueorFalsePageState extends State<TrueorFalsePage> {
  PageController pageController = PageController(initialPage: 0);

  bool isSelected = false;

  Color? btnColor = Colors.grey[600];
  Color isCorrect = Colors.green;
  Color isWrong = Colors.red;

  double score = 0.0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [closeButtonWidget(context: context)],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (currentPage) {
          setState(() => isSelected = false);
        },
        itemCount: trueorfalseController.length,
        itemBuilder: (context, index) => Column(
          children: [
            const Spacer(),
            Text(
              "Question ${index + 1} / ${trueorfalseController.length}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            const Divider(
              indent: 50.0,
              endIndent: 50.0,
              height: 20.0,
              thickness: 2.0,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                trueorfalseController[index].question,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const Spacer(),
            for (var i = 0;
                i < trueorfalseController[index].answer!.length;
                i++)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: SizedBox(
                  height: _size.height * 0.07,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      side: BorderSide(
                        color: isSelected
                            ? trueorfalseController[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value
                                ? isCorrect
                                : isWrong
                            : Colors.grey.shade600,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                      });
                      if (trueorfalseController[index]
                          .answer!
                          .entries
                          .toList()[i]
                          .value) {
                        score += 1.0;
                      }
                    },
                    child: Text(
                      trueorfalseController[index]
                          .answer!
                          .keys
                          .toList()[i]
                          .toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                alignment: Alignment.center,
                height: _size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                          'Trivia',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.grey[500],
                          thickness: 2.0,
                          height: 30.0,
                        ),
                        Text(
                          isSelected ? trueorfalseController[index].trivia : "",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSelected
                      ? () {
                          currentIndex += 1;
                          // print(score);
                          if (currentIndex == trueorfalseController.length) {
                            SharePrefConfig.setTrueorFalse(score.toString());

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      KnowledgeResultPage(score: score),
                                ),
                                (route) => false);
                          } else {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        }
                      : null,
                  child: const Text('Continue'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPrimary: Colors.white,
                      primary: kbtnColor,
                      padding: const EdgeInsets.symmetric(vertical: 20.0)),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
