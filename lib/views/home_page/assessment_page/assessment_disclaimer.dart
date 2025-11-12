import 'package:flutter/material.dart';
import 'package:umatter/components/close_button.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/assessment_page/welcome_page.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class AssessmentDisclaimerPage extends StatelessWidget {
  const AssessmentDisclaimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            closeButtonWidget(context: context),
            const Spacer(
              flex: 2,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Before you proceed, let\'s assess your condition first',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  primary: kPrimaryFrmColor,
                ),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                      insetPadding: const EdgeInsets.all(40.0),
                      titleTextStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      backgroundColor: Colors.grey[50],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Disclaimer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: Text(
                        'The following Assessment is from the Primary Care Evaluation of Mental Disorders Patient Health Questionnaire (PRIME-MD PHQ). The PHQ was developed by Drs. Robert L. Spitzer, Janet B.W. Williams, Kurt Kroenke and colleagues. For research information, contact Dr. Spitzer at rls8@columbia.edu. PRIME-MD® is a trademark of Pfizer Inc. Copyright© 1999 Pfizer Inc. All rights reserved. Reproduced with permission.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          letterSpacing: 1.0,
                          wordSpacing: 1.0,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            height: _size.height * 0.08,
                            width: double.infinity,
                            child: ElevatedButton(
                              // Navigate to Assessment Page
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LabelPage(),
                                ),
                              ),

                              child: const Text('Understood'),
                              style: ElevatedButton.styleFrom(
                                primary: kbtnColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Sure thing!',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "* Important Notice : UMatter is not intended to replace any clinical diagnosis or treatment.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[500],
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontStyle: FontStyle.italic,
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
