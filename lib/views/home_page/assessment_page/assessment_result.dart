import 'package:flutter/material.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

import '../../../controllers/shared_pref_controller/shared_pref_controller.dart';
import '../reach_out/directories_page.dart';

class AssessmentResult extends StatefulWidget {
  final String assessmentRes;
  const AssessmentResult({Key? key, required this.assessmentRes})
      : super(key: key);

  @override
  State<AssessmentResult> createState() => _AssessmentResultState();
}

class _AssessmentResultState extends State<AssessmentResult> {
  String assessmentScore = (SharePrefConfig.getAssessmentScore() ?? "0");
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Center(
                child: Text(
                  "Assessment Result".toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[100],
                ),
                child: Text(
                  assessmentScore,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Based on the result of your PHQ9 Assessment, you are manifesting ',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                          letterSpacing: 1.0),
                    ),
                    TextSpan(
                      text: widget.assessmentRes,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[100],
                        // fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        letterSpacing: 1.0,
                      ),
                    ),
                    TextSpan(
                      text: " of a seemingly mental health condition",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: _size.height * 0.08,
                width: double.infinity,
                child: ElevatedButton(
                  style: kElevatedbtnprimary,
                  onPressed: () {
                    if (widget.assessmentRes == "Mild" ||
                        widget.assessmentRes == "Moderate") {
                      SharePrefConfig.setAnswered('1');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const DiscoverPage()));
                    } else if (widget.assessmentRes == "Moderately Severe" ||
                        widget.assessmentRes == "Severe") {
                      SharePrefConfig.setAnswered('1');
                      _buildDialog();
                    }
                    // print(widget.assessmentRes);
                  },
                  child: const Text(
                    'Got it!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  _buildDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Do you wish to look for a consultation with a list of licensed professionals right now or proceed with our recommendations?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const NavBarPage(),
                    ),
                    (route) => false),
                icon: const Icon(Icons.close),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ReachOutPage()),
                    (route) => false),
                icon: Icon(
                  Icons.check,
                  color: Colors.red.shade400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
