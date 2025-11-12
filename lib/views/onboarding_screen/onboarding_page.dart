import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:umatter/auth/auth_pages/login_page_controller.dart';
import 'package:umatter/controllers/onboarding_screen_controller/onboarding_controller.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/utils/colors.dart';

import '../../components/termsandconditions.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = OnboardingController();
  final pageController = PageController();
  final sharedPref = SharePrefConfig();
  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              buildPage(
                img: _controller.onboardingPages[0].img,
                title: _controller.onboardingPages[0].title,
                subtitle: _controller.onboardingPages[0].desc,
              ),
              buildPage(
                img: _controller.onboardingPages[1].img,
                title: _controller.onboardingPages[1].title,
                subtitle: _controller.onboardingPages[1].desc,
              ),
              buildPage(
                img: _controller.onboardingPages[2].img,
                title: _controller.onboardingPages[2].title,
                subtitle: _controller.onboardingPages[2].desc,
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: _size.height * 0.24,
          child: Column(
            children: [
              // Slider
              Container(
                padding: const EdgeInsets.all(20.0),
                // color: Colors.orange,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: _controller.onboardingPages.length,
                    effect: WormEffect(
                      spacing: 16,
                      dotColor: Colors.grey.shade300,
                      activeDotColor: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Button
              isLastPage
                  ? ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            content: SingleChildScrollView(
                              child: Text(
                                termsandConditions,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                            actions: [
                              SizedBox(
                                height: _size.height * 0.06,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryColor),
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              const LogInPage())),
                                  child: const Text('Continue'),
                                ),
                              )
                            ],
                          ),
                        );

                        await sharedPref.onboardingPageInfoController();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 20.0),
                        primary: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('Get Started'),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                            shape: const CircleBorder(),
                            primary: Colors.orangeAccent,
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                          ),
                        ),
                      ],
                    ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(
      {required String img, required String title, required String subtitle}) {
    return Column(children: [
      // Image
      Container(
        padding: const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height * 0.43,
        child: Lottie.asset(img),
      ),
      const Spacer(),
      // title
      Text(
        title,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
      const Spacer(),
      // subtitle
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          subtitle,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[600],
            letterSpacing: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const Spacer(flex: 2),
    ]);
  }
}
