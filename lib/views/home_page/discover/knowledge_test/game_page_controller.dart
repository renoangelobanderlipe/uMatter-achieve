import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/multiple_choice/multiple_choice_page.dart';

import 'game_page_model.dart';
import 'true_false/trueorfalse_page.dart';

List<GamePageModel> gamepageController = [
  GamePageModel(
    "True or False",
    "You’ve got a 50% chance of getting the answer right. The other 50%? not really a loss, it’s on trivia.",
    const Color(0xff457b9d),
    "",
    const TrueorFalsePage(),
  ),
  GamePageModel(
    "Multiple Choice",
    "Here’s a little tricky. However, you’ll also get trivia along the way.",
    const Color(0xff81b29a),
    "",
    const MultipleChoicePage(),
  )
];
