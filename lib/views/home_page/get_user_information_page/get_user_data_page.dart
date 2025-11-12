import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/components/close_button.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  PageController pageController = PageController();
  DatabaseManager databaseManager = DatabaseManager();
  SharePrefConfig sharePrefConfig = SharePrefConfig();

  final _formKey = GlobalKey<FormState>();

  final civilStatusItem = ['Single', 'Married', 'Separated', 'Widowed'];
  final genderItem = ["Male", "Female", "Others"];

  String username = "";
  String age = '';
  String? genderValue;
  String? civilStatusValue;

  final email = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [closeButtonWidget(context: context)],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/img/assessment/user_information.svg',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text('Username'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        // controller: username,
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username field is required";
                          }
                          if (value.length <= 3) {
                            return "Username must be greater than 3";
                          }
                          if (value.length > 10) {
                            return "Username must be less than 10";
                          } else {
                            setState(() {});
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text('Age'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (value) => age = value,
                        validator: (value) {
                          int parseAge = int.parse(age);
                          if (value!.isEmpty) {
                            return "Age field required";
                          } else if (parseAge >= 12 || parseAge <= 60) {
                            return "Invalid age type";
                          }
                          // if (int.parse(value) >= 16 &&
                          //     int.parse(value) <= 60) {
                          //   return "Invalid age type";
                          // } else {
                          else {
                            setState(() {});
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Gender"),
                            SizedBox(
                              width: 140.0,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  iconSize: 40,
                                  value: genderValue,
                                  // isExpanded: true,
                                  items:
                                      genderItem.map(buildGenderList).toList(),
                                  onChanged: (genderValue) {
                                    setState(() {
                                      this.genderValue = genderValue as String?;
                                    });
                                    // print(genderValue);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Civil Status"),
                            SizedBox(
                              width: 140.0,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  iconSize: 40,
                                  value: civilStatusValue,
                                  // isExpanded: true,
                                  items: civilStatusItem
                                      .map(buildCivilList)
                                      .toList(),
                                  onChanged: (civilStatusValue) {
                                    setState(() {
                                      this.civilStatusValue =
                                          civilStatusValue as String?;
                                    });
                                    // print(civilStatusValue);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      SizedBox(
                        height: _size.height * 0.07,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryFrmColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: () async {
                            _formKey.currentState!.validate();
                            databaseManager.createUserInfo(email, username, age,
                                genderValue, civilStatusValue);

                            CollectionReference ref = FirebaseFirestore.instance
                                .collection('users')
                                .doc('users_list')
                                .collection('users_info');

                            var userData = {
                              'email': email,
                              'username': username,
                              'age': age,
                              'gender': genderValue,
                              "civil_status": civilStatusValue,
                            };
                            ref.add(userData);

                            Navigator.of(context).pop();
                          },
                          child: const Text('Continue'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildGenderList(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  DropdownMenuItem<String> buildCivilList(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
