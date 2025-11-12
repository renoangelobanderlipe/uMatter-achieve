import 'package:flutter/material.dart';
import 'package:umatter/models/onboarding_page_models/onboarding_model.dart';

class OnboardingController {
  var pageController = PageController();

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo("assets/img/onboarding/preparation.json", 'Buckle Up',
        "Prepare yourself for the journey. Take the assessment and let’s find out what you’re going through "),
    OnboardingInfo("assets/img/onboarding/habit.json", 'Heads Up!',
        "Make your journey a habit. Take some space and explore freely on our recommendations."),
    OnboardingInfo("assets/img/onboarding/track.json", 'Keep It Up',
        "Stay on track of your journey.  3 weeks is all you need to check for your progress."),
  ];
}
