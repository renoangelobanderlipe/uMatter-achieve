import 'package:get/get.dart';
import 'package:umatter/models/assessment_model/assessment_model.dart';

class AssessmentController extends GetxController {
  List<QuestionsModel> questionsController = [
    QuestionsModel("Little interest or pleasure in doing things."),
    QuestionsModel("Feeling down, depressed, or hopeless."),
    QuestionsModel("Trouble falling or staying asleep, or sleeping too much."),
    QuestionsModel("Feeling tired or having little energy."),
    QuestionsModel("Poor appetite or overeating."),
    QuestionsModel(
        "Feeling bad about yourself or that you are a failure or have let yourself or your family down."),
    QuestionsModel(
        "Trouble concentrating on things, such as reading the newspaper or watching television."),
    QuestionsModel(
        "Moving or speaking so slowly that other people could have noticed? Or the opposite being so fidgety or restless that you have been moving around a lot more than usual."),
    QuestionsModel(
        "Thoughts that you would be better off dead or of hurting yourself in some way"),
  ];
}
