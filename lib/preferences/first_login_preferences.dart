import 'package:shared_preferences/shared_preferences.dart';

class FirstLoginPreferences {
  static const key = 'first_login_key';

  disabledFirstLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, false);
  }

  isFirstLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(key)) {
      return sharedPreferences.getBool(key);
    } else {
      return true;
    }
  }
}
