import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/controllers/assessment_controller/assessment_controller.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/assessment_page/assessment_result.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  PageController pageController = PageController();
  DatabaseManager databaseManager = DatabaseManager();

  final controller = AssessmentController();

  List<int> scores = [];
  List<String> assessmentList = [];
  List<String> assessmentScores = [];

  String depressionLevel = '';
  int totalScore = 0;
  var selectedItem = '';
  var selectedPageIndex = 0.obs;

  final email = FirebaseAuth.instance.currentUser?.email;

  Color btnColor = const Color(0xffffcb77);

  /// This will check if the user reached the last page
  bool get isLastPage =>
      selectedPageIndex.value == controller.questionsController.length - 1;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const NavBarPage()),
                (route) => false),
            icon: const Icon(Icons.close_rounded),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: selectedPageIndex,
          controller: pageController,
          itemCount: controller.questionsController.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Question ${index + 1} / ${controller.questionsController.length}",
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
                      const SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        controller.questionsController[index].question,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[800],
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Column(
                    children: [
                      _buildFirstBtn(_size),
                      const SizedBox(height: 15.0),
                      _buildSecondBtn(_size),
                      const SizedBox(height: 15.0),
                      _buildThirdBtn(_size),
                      const SizedBox(height: 15.0),
                      _buildFourthBtn(_size),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _buildFirstBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: btnColor,
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "Not at all";
          int score = 0;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());
          nextPageController();
          // print(score);
          // print(selectedItem);
          // print(selectedItem);
        },
        child: const Text(
          'Not at all',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildSecondBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: btnColor,
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "Several days";
          int score = 1;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());

          nextPageController();
          // print(score);
          // print(selectedItem);
        },
        child: const Text(
          'Several days',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildThirdBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: btnColor,
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "More than half the days";
          int score = 2;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());
          nextPageController();

          // print(score);
          // print(selectedItem);
        },
        child: const Text(
          'More than half the days',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildFourthBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 2.0,
          primary: btnColor,
        ),
        onPressed: () {
          selectedItem = "Nearly Everyday";
          int score = 3;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());
          nextPageController();

          // print(score);
          // print(selectedItem);
        },
        child: const Text(
          'Nearly Everyday',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  sumScores() {
    num score = 0;
    for (var e in scores) {
      score += e;
      SharePrefConfig.setAssessmentScore(score.toString());
    }
    totalScore = score.toInt();

    if (score >= 0 && score <= 5) {
      depressionLevel = "Mild";
      return depressionLevel;
    } else if (score >= 6 && score <= 10) {
      depressionLevel = "Moderate";
      return depressionLevel;
    } else if (score >= 11 && score <= 15) {
      depressionLevel = "Moderately Severe";
      return depressionLevel;
    } else if (score >= 16) {
      depressionLevel = "Severe";
      return depressionLevel;
    }
    // SharePrefConfig.setAssessmentScore(score.toString());
    return score;
  }

  nextPageController() {
    if (isLastPage == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AssessmentResult(
            assessmentRes: sumScores(),
          ),
        ),
      );
      // print(sumScores());
      SharePrefConfig.setAssessment(assessmentList);
      SharePrefConfig.setAssessment(assessmentScores);
      databaseManager.addAssessmentForm(controller.questionsController.length,
          assessmentList, sumScores().toString(), totalScore);

      CollectionReference ref = FirebaseFirestore.instance
          .collection('users')
          .doc('assessment')
          .collection('assessment');

      var data = {
        "question": controller.questionsController.length,
        "user_selection": assessmentList,
        "depression_severity": sumScores().toString(),
        "score": totalScore,
        "email": email
      };
      ref.add(data);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
