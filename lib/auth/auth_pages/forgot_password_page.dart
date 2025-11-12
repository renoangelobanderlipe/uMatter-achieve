import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/auth_pages/login_page.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                _buildIcon(),
                const SizedBox(
                  height: 50.0,
                ),
                _buildFormField(),
                _buildReturnLogin(),
                SizedBox(
                  height: _size.height * 0.08,
                ),
                _buildForgetBtn(_size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildIcon() => Lottie.asset('assets/img/authentication/forget_password.json',
      width: 260.0);

  _buildFormField() => TextFormField(
        controller: emailController,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(labelText: "Email"),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? "Enter a valid email"
            : null,
      );
  _buildReturnLogin() => Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginWidget(),
            ),
          ),
          child: const Text('Return to login page'),
        ),
      );

  _buildForgetBtn(_size) => SizedBox(
        height: _size.height * 0.07,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1.0,
              primary: kPrimaryFrmColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          onPressed: resetPassword,
          child: const Text('Reset Password'),
        ),
      );

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      // Message Content
      const message = SnackBar(
        content: Text("Reset Password Sent"),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
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
              content: Text(
                'User not found',
              ),
            ),
          );
          break;
      }
    }
  }
}
