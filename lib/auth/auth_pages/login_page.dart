import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/auth_pages/create_account_page.dart';
import 'package:umatter/auth/auth_pages/forgot_password_page.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/components/termsandconditions.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final databaseController = DatabaseManager();

  SharePrefConfig sharePrefConfig = SharePrefConfig();
  late TabController _tabController;

  bool connection = true;
  bool isShow = true;

  late TabController controller;

  @override
  void initState() {
    super.initState();
    // This will check if the user has a connection status
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connection = status == InternetConnectionStatus.connected;
      setState(() => this.connection = connection);
    });
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
    controller.dispose();
    super.dispose();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: connection
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      // const SizedBox(height: 20.0),
                      _buildIcon(),
                      _buildWelcome(),
                      _buildEmailForm(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordForm(),
                      _buildCreateandForget(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _buildLoginBtn(_size),
                      const SizedBox(
                        height: 10.0,
                      ),

                      _buildGoogleBtn(_size),
                      const SizedBox(height: 20.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (icChecked) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              }),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: ' I agree to the ',
                                    style: TextStyle(color: Colors.grey[700])),
                                TextSpan(
                                  text: "Terms and Condition",
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
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
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                                child: const Text('Continue'),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                ),
                                // TextSpan(
                                //     text: " and ",
                                //     style:
                                //         TextStyle(color: Colors.grey[700])),
                                // TextSpan(
                                //   text: "Privacy Policy",
                                //   style: TextStyle(color: Colors.blue),
                                //   recognizer: TapGestureRecognizer()
                                //     ..onTap = () {
                                //       showDialog(
                                //         context: context,
                                //         builder: (context) => AlertDialog(
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(
                                //                       10.0)),
                                //           content: SingleChildScrollView(
                                //             child: Text(
                                //               privacyandPolicy,
                                //               style: TextStyle(
                                //                 color: Colors.grey[700],
                                //                 fontSize: 12.0,
                                //                 fontWeight: FontWeight.bold,
                                //                 letterSpacing: 1.0,
                                //               ),
                                //             ),
                                //           ),
                                //           actions: [
                                //             SizedBox(
                                //               height: _size.height * 0.06,
                                //               width: double.infinity,
                                //               child: ElevatedButton(
                                //                 style:
                                //                     ElevatedButton.styleFrom(
                                //                         primary:
                                //                             kPrimaryColor),
                                //                 onPressed: () =>
                                //                     Navigator.of(context)
                                //                         .pop(),
                                //                 child: const Text('Continue'),
                                //               ),
                                //             )
                                //           ],
                                //         ),
                                //       );
                                //     },
                                // ),
                              ],
                            ),
                          ),
                        ],
                      )
                      // Text('I agree to the '),
                      // TextButton(
                      //   onPressed: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) => AlertDialog(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius:
                      //                 BorderRadius.circular(10.0)),
                      //         content: SingleChildScrollView(
                      //           child: Text(
                      //             termsandConditions,
                      //             style: TextStyle(
                      //               color: Colors.grey[700],
                      //               fontSize: 12.0,
                      //               fontWeight: FontWeight.bold,
                      //               letterSpacing: 1.0,
                      //             ),
                      //           ),
                      //         ),
                      //         actions: [
                      //           SizedBox(
                      //             height: _size.height * 0.06,
                      //             width: double.infinity,
                      //             child: ElevatedButton(
                      //               style: ElevatedButton.styleFrom(
                      //                   primary: kPrimaryColor),
                      //               onPressed: () =>
                      //                   Navigator.of(context).pop(),
                      //               child: const Text('Continue'),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   child: const Text(
                      //     'Terms and Condition',
                      //     style: TextStyle(
                      //       fontSize: 12.0,
                      //     ),
                      //   ),
                      // ),
                      // const Text('and'),
                      // TextButton(
                      //   onPressed: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) => AlertDialog(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius:
                      //                 BorderRadius.circular(10.0)),
                      //         content: SingleChildScrollView(
                      //           child: Text(
                      //             privacyandPolicy,
                      //             style: TextStyle(
                      //               color: Colors.grey[700],
                      //               fontSize: 12.0,
                      //               fontWeight: FontWeight.bold,
                      //               letterSpacing: 1.0,
                      //             ),
                      //           ),
                      //         ),
                      //         actions: [
                      //           // Checkbox(
                      //           //   value: isChecked,
                      //           //   onChanged: (isChecked) => setState(() {
                      //           //     this.isChecked = isChecked!;
                      //           //   }),
                      //           // ),
                      //           SizedBox(
                      //             height: _size.height * 0.06,
                      //             width: double.infinity,
                      //             child: ElevatedButton(
                      //               style: ElevatedButton.styleFrom(
                      //                   primary: kPrimaryColor),
                      //               onPressed: () =>
                      //                   Navigator.of(context).pop(),
                      //               child: const Text('Continue'),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   child: const Text(
                      //     'Privacy Policy',
                      //     style: TextStyle(fontSize: 12.0),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // ),
                    ],
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      'assets/img/authentication/no-internet.json')),
        ),
      ),
    );
  }

  _buildIcon() =>
      Lottie.asset('assets/img/authentication/welcome.json', width: 240.0);

  _buildWelcome() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Text(
          "Welcome to UMatter",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      );

  _buildEmailForm() => TextField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        cursorColor: Colors.black,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(labelText: "Email"),
      );
  _buildPasswordForm() => TextField(
        controller: passwordController,
        cursorColor: Colors.black,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: IconButton(
            onPressed: () => setState(() => isShow = !isShow),
            icon: isShow
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility_outlined),
          ),
        ),
        obscureText: isShow,
      );

  _buildCreateandForget() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateAccountPage())),
            child: const Text('Create an Account'),
          ),
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgetPasswordPage())),
            child: const Text('Forgot Password'),
          )
        ],
      );

  _buildLoginBtn(_size) => SizedBox(
        width: double.infinity,
        height: _size.height * 0.07,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1.0,
              primary: kPrimaryFrmColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          onPressed: isChecked == true
              ? () {
                  databaseController.signIn(emailController, passwordController,
                      context, sharePrefConfig);
                }
              : null,
          child: const Text('Sign In'),
        ),
      );

  _buildGoogleBtn(_size) => SizedBox(
        width: double.infinity,
        height: _size.height * 0.07,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          onPressed: isChecked
              ? () {
                  databaseController.googleLogin();
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const FaIcon(FontAwesomeIcons.google),
              const Text('Sign in with Google'),
              Container(),
            ],
          ),
        ),
      );
}
