import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umatter/auth/auth_pages/login_page_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DatabaseManager {
  signIn(emailController, passwordController, context, sharePrefConfig) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      sharePrefConfig.onboardingPageInfoController();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Invalid email',
              ),
            ),
          );
          break;

        case "user-not-found":
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not found'),
            ),
          );
          break;

        case "wrong-password":
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid password'),
            ),
          );
          break;

        default:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please check your credentials and try again'),
            ),
          );
      }
    }
  }

  /// If your user signs in with Google, after having already manually registered an account, their authentication provider will automatically change to Google, due to Firebase Authentications concept of trusted providers.
  googleLogin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<Future<Object?>> signOut(context) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("assessmentScore");
    sharedPreferences.remove("answered");
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LogInPage()),
        (route) => false);
    // return Get.to(() => const LogInPage());
  }

  Future deleteUser(context) async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Invalid email',
            ),
          ),
        );
        // print(
        //     'The user must reauthenticate before this operation can be executed');
      }
    }
  }

  // Diary Page
  Future addForm(
      String title, String desc, formKey, String emotions, context) async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    // Create user data
    var data = {
      'title': title,
      'description': desc,
      'created': DateTime.now(),
      'emotions': emotions.toString(),
    };

    // Validate Form
    if (formKey.currentState!.validate()) {
      ref.add(data);
    }
    Navigator.of(context).pop();
    // Get.back();
  }

  createUserInfo(email, username, age, gender, civilStatus) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .collection('user_info');

    var userData = {
      'email': email,
      'username': username,
      'age': age,
      'gender': gender,
      "civil_status": civilStatus,
    };
    ref.add(userData);
  }

  addAssessmentForm(question, userSelection, depressionSeverity, score) async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('assessment');

    var data = {
      "question": question,
      "user_selection": userSelection,
      "depression_severity": depressionSeverity,
      "score": score,
    };
    ref.add(data);
  }

  // getAssessmentScore(snapshot) {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   CollectionReference ref = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(firebaseAuth.currentUser?.uid)
  //       .collection('assessment');
  //   var data;
  //   snapshot.data?.docs.forEach((doc) => {data = doc.data()});

  //   return data;
  // }
}
