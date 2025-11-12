import 'package:shared_preferences/shared_preferences.dart';

class SharePrefConfig {
  onboardingPageInfoController() async {
    int isViewed = 0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt("onboarding", isViewed);
  }

   

  static SharedPreferences _preferences =
      SharedPreferences.getInstance() as SharedPreferences;

  static const _keyReason = 'reasonList';
  static const _keyEmotions = 'emotions';
  static const _keyAssessment = 'assessment';
  static const _keyAssessmentScore = 'assessmentScore';
  static const _keyTrueorFalseScore = 'trueorfalseScore';
  static const _keyTrueorMultipleChoiceScore = 'multiplechoiceScore';
  static const _keyAnswered = 'answered';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
// Reasons
  static Future setReasons(List<String> reasonList) async =>
      await _preferences.setStringList(_keyReason, reasonList);

  static List<String>? getReasons() => _preferences.getStringList(_keyReason);

// Emojis
  static Future setEmoji(String emotions) =>
      _preferences.setString(_keyEmotions, emotions);

  static String? getEmoji() => _preferences.getString(_keyEmotions);

  //  Assessment
  static Future setAssessment(List<String> assessment) async =>
      await _preferences.setStringList(_keyAssessment, assessment);

  static List<String>? getAssessment() =>
      _preferences.getStringList(_keyAssessment);
  // _preferences.getIntList(_keyAssessment);

  // Assessment Score
  static Future setAssessmentScore(String assessmentScore) async =>
      await _preferences.setString(_keyAssessmentScore, assessmentScore);

  static String? getAssessmentScore() =>
      _preferences.getString(_keyAssessmentScore);

  // True or false Score
  static Future setTrueorFalse(String trueorfalseScore) async =>
      await _preferences.setString(_keyTrueorFalseScore, trueorfalseScore);

  static String? getTrueofFalse() =>
      _preferences.getString(_keyTrueorFalseScore);

  // Multiple Choice Score
  static Future setMultipleChoice(String multiplechoiceScore) async =>
      await _preferences.setString(
          _keyTrueorMultipleChoiceScore, multiplechoiceScore);

  static String? getMultipleChoice() =>
      _preferences.getString(_keyTrueorMultipleChoiceScore);

  // Multiple Choice Score
  static Future setAnswered(String answered) async =>
      await _preferences.setString(_keyAnswered, answered);

  static String? getAnswered() => _preferences.getString(_keyAnswered);
}
