import 'package:umatter/models/discover_model/discover_model.dart';
import 'package:umatter/views/home_page/discover/fact_page/fact_page.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/game_page.dart';
import 'package:umatter/views/home_page/discover/myths/myths_page.dart';

class DiscoverControllerPage {
  List<DiscoverInfoPage> discoverPage = [
    DiscoverInfoPage(
      "Facts",
      "Unveil the truth about Depression.",
      "assets/img/discover/fact_check.svg",
      const FactPage(),
    ),
    DiscoverInfoPage(
      "Myths",
      "Common misconceptions you may encounter about Depression.",
      "assets/img/discover/myths.svg",
      const MythsPage(),
    ),
    DiscoverInfoPage(
      "Quizzes",
      "See how well you know when it comes to Depression.",
      "assets/img/discover/knowledge.svg",
      const GamePage(),
    ),
  ];
}
