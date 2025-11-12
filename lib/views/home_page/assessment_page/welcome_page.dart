import 'package:flutter/material.dart';
import 'package:umatter/components/close_button.dart';
import 'package:umatter/views/home_page/assessment_page/assessment_page.dart';
import 'package:umatter/views/home_page/assessment_page/option_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class LabelPage extends StatefulWidget {
  const LabelPage({Key? key}) : super(key: key);

  @override
  State<LabelPage> createState() => _LabelPageState();
}

class _LabelPageState extends State<LabelPage> {
  final OptionControllerPage _optionControllerPage = OptionControllerPage();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            closeButtonWidget(context: context),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                'Over the last 2 weeks, how often have you been bothered by any of the following problems?',
                // textAlign: TextAlign.justify,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Selections',
                    // style: Theme.of(context).textTheme.headline5,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[600],
                        letterSpacing: 0.5),
                  ),
                  Text(
                    'Scores',
                    // style: Theme.of(context).textTheme.headline5,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[600],
                        letterSpacing: 0.5),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: _size.height / 3,
                child: ListView.builder(
                  itemCount: _optionControllerPage.optionInfoModel.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                  color: Colors.grey[300],
                                ),
                                height: _size.height * 0.06,
                                child: Center(
                                  child: Text(
                                    _optionControllerPage
                                        .optionInfoModel[index].option,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: _size.height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  color: Colors.grey[350],
                                ),
                                child: Center(
                                  child: Text(
                                    "${_optionControllerPage.optionInfoModel[index].score}",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        )
                      ],
                    );
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                height: _size.height * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryFrmColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const AssessmentPage(),
                    //   ),
                    // );
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        title: const Center(
                          child: Text(
                            'Are you sure you want to proceed?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        content: const Text(
                          'By proceeding you agreed to the terms and conditions.',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red[600],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              IconButton(
                                onPressed: () =>
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AssessmentPage(),
                                        ),
                                        (route) => false),
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
