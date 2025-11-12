import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/components/privacy_policy.dart';
import 'package:umatter/components/termsandconditions.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/settings_page/settings_card_widget.dart';
import 'package:umatter/views/home_page/settings_page/settings_controller.dart';
import 'package:umatter/views/home_page/settings_page/settings_label_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final controller = SettingsControllerPage();
  final databaseController = DatabaseManager();

  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('user_info');

  dynamic data;
  getUserData(snapshot) {
    snapshot.data?.docs.forEach((doc) => {data = doc.data()});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final kBoxHeight = size.height * 0.09;

    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot>(
            future: ref.get(),
            builder: (context, snapshot) {
              getUserData(snapshot);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30.0),
                    child: Text('Settings', style: kAppBarTitle),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      settingsLabelWidget(
                        title: 'Personal Information',
                        width: 20.0,
                        height: 20.0,
                        fontSize: 18.0,
                        fontColor: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                      // userInfoWidget(size, data['username'], data['age'],
                      //     data['gender'], data['civilstatus']),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          height: size.height * 0.2,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            letterSpacing: 0.3),
                                      ),
                                      const Divider(),
                                      Text(
                                        "Age",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            letterSpacing: 0.3),
                                      ),
                                      const Divider(),
                                      Text(
                                        "Gender",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            letterSpacing: 0.3),
                                      ),
                                      const Divider(),
                                      Text(
                                        "Civil Status",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            letterSpacing: 0.3),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data != null ? data['username'] : '',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          letterSpacing: 0.3,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Divider(),
                                      Text(
                                        data != null ? data['age'] : '',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          letterSpacing: 0.3,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Divider(),
                                      Text(
                                        data != null ? data['gender'] : '',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          letterSpacing: 0.3,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Divider(
                                        height: 10,
                                      ),
                                      const Divider(),
                                      Text(
                                        data != null
                                            ? data['civil_status']
                                            : '',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          letterSpacing: 0.3,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(),
                                  Container(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      settingsLabelWidget(
                        title: 'Application Standards',
                        width: 20.0,
                        height: 20.0,
                        fontSize: 18.0,
                        fontColor: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      termsandConditions,
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    // Checkbox(
                                    //   value: isChecked,
                                    //   onChanged: (isChecked) => setState(() {
                                    //     this.isChecked = isChecked!;
                                    //   }),
                                    // ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
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
                        style: TextButton.styleFrom(
                            primary: Colors.grey[600],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0)),
                        child: settingsCardWidget(
                          title: controller.settingsController[1].title,
                          icon: Icons.description_outlined,
                          cardHeight: kBoxHeight,
                          context: context,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              content: SingleChildScrollView(
                                child: Text(
                                  privacyandPolicy,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
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
                        style: TextButton.styleFrom(
                            primary: Colors.grey[600],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0)),
                        child: settingsCardWidget(
                          title: controller.settingsController[2].title,
                          icon: Icons.privacy_tip_outlined,
                          cardHeight: kBoxHeight,
                          context: context,
                        ),
                      ),

                      settingsLabelWidget(
                        title: 'Actions',
                        width: 20.0,
                        height: 20.0,
                        fontSize: 18.0,
                        fontColor: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey[600],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0)),
                        onPressed: () => databaseController.deleteUser(context),
                        child: settingsCardWidget(
                          title: controller.settingsController[4].title,
                          icon: Icons.delete_outline,
                          cardHeight: kBoxHeight,
                          context: context,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey[600],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0)),
                        onPressed: () async {
                          String toEmail = 'umatter.reboot@gmail.com';
                          final url = 'mailto:$toEmail';

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: settingsCardWidget(
                          title: controller.settingsController[5].title,
                          icon: Icons.report_gmailerrorred_outlined,
                          cardHeight: kBoxHeight,
                          context: context,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey[600],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0)),
                        onPressed: () => databaseController.signOut(context),
                        child: settingsCardWidget(
                          title: controller.settingsController[6].title,
                          icon: Icons.logout_rounded,
                          cardHeight: kBoxHeight,
                          context: context,
                        ),
                      ),
                      const SizedBox(
                        height: 70.0,
                      )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget userInfoWidget(size, name, age, gender, civilstatus) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: size.height * 0.2,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                    const Divider(),
                    Text(
                      "Age",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                    const Divider(),
                    Text(
                      "Gender",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                    const Divider(),
                    Text(
                      "Civil Status",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(),
                    Text(
                      age,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(),
                    Text(
                      gender,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(
                      height: 10,
                    ),
                    const Divider(),
                    Text(
                      civilstatus,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(),
                Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
