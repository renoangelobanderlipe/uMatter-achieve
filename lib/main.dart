import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umatter/auth/auth_pages/login_page_controller.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/onboarding_screen/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';

int? isViewed;
// int? isDisplayed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Prevent the screen to rotate
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Shared Preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isViewed = sharedPreferences.getInt("onboarding");
  await SharePrefConfig.init();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: isViewed != 0 ? const OnboardingPage() : const LogInPage(),
    );
  }
}
