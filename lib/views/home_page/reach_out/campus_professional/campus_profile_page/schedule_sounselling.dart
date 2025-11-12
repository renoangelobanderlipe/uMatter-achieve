import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:umatter/views/home_page/settings_page/constant/settings_constant.dart';

class ScheduleCounsellingPage extends StatefulWidget {
  const ScheduleCounsellingPage({Key? key}) : super(key: key);

  @override
  State<ScheduleCounsellingPage> createState() =>
      _ScheduleCounsellingPageState();
}

class _ScheduleCounsellingPageState extends State<ScheduleCounsellingPage> {
  final formKey = GlobalKey<FormState>();

  // final emailController = TextEditingController();
  // final fullname = TextEditingController();
  // final homeAddress = TextEditingController();
  // final contact = TextEditingController();

  final contactRegex = RegExp(r'^(09|\+639)\d{9}$');
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // final fullnameRegex = RegExp(
  //   r"[\D.,]+$",
  //   // r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$",
  // );
  final addressRegex = RegExp(r'[\D.,]+$');

  String email = '';
  String fullname = '';
  String homeAddress = '';
  String contact = '';
  String others = '';

  bool isChecked = false;
  bool academic = false;
  bool personal = false;
  bool career = false;

  String academicRes = '';
  String personalRes = '';
  String careerRes = '';

  final message = const SnackBar(
    content: Text('Reponse Sent!'),
  );

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Consultation Request',
            style: kAppBarTitle,
          ),
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.grey[300],
              ),
              onPressed: () => Navigator.of(context).pop()),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close,
                color: Colors.grey[300],
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // controller: emailController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? "Enter a valid email"
                            : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => setState(() => email = value),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    // controller: emailController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: "Full Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Full name field is needed";
                      }

                      // if (!contactRegex.hasMatch(value)) {
                      //   return "Invalid name format";
                      // }
                      return null;
                    },
                    onChanged: (value) => setState(() => fullname = value),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    // controller: emailController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration:
                        const InputDecoration(labelText: "Home Addresss"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Home Address field is needed";
                      }

                      if (!addressRegex.hasMatch(value)) {
                        return "Invalid Address format";
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() => homeAddress = value),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    // controller: contact,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration:
                        const InputDecoration(labelText: "Contact Number"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a contact number";
                      }

                      if (!contactRegex.hasMatch(value)) {
                        return "Enter a valid contact number";
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() => contact = value),
                    // ^(09|\+639)\d{9}$
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Purpose of Consultation',
                    style: kSettingsFnt,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: academic,
                          onChanged: (academic) {
                            setState(() {
                              this.academic = academic!;
                            });
                            if (this.academic == true) {
                              academicRes = 'Academic';
                            } else if (academic == false) {
                              academicRes = '';
                            }
                          }),
                      const Text('Academic'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: personal,
                          onChanged: (personal) {
                            setState(() {
                              this.personal = personal!;
                            });
                            if (this.personal == true) {
                              personalRes = 'Personal-Social';
                            } else if (career == false) {
                              personalRes = '';
                            }
                          }),
                      const Text('Personal-Social'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: career,
                          onChanged: (career) {
                            setState(() {
                              this.career = career!;
                            });
                            if (this.career == true) {
                              careerRes = 'Career-Vocational';
                            } else if (career == false) {
                              careerRes = '';
                            }
                          }),
                      const Text('Career-Vocational'),
                    ],
                  ),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    // controller: contact,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: "Others"),

                    onChanged: (value) => setState(() => others = value),
                    // ^(09|\+639)\d{9}$
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (icChecked) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          }),
                      Container(
                        width: _size.width / 1.41,
                        // color: Colors.orangeAccent,
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'I hereby agree that the information shared above are true and correct and that these information can only be used for the sole purpose of this consultation.',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.red[200],
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      onPressed: isChecked
                          ? () {
                              final isValid = formKey.currentState!.validate();

                              if (isValid) {
                                var dNow = DateFormat.yMMMd()
                                    .add_jm()
                                    .format(DateTime.now());
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(message);
                                // print(email);
                                // print(fullname);
                                // print(homeAddress);
                                // print(contact);
                                // print(academicRes);
                                // print(careerRes);
                                // print(others);

                                CollectionReference ref = FirebaseFirestore
                                    .instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .collection('counselling');

                                final data = {
                                  "email": email,
                                  "full_name": fullname,
                                  "home_address": homeAddress,
                                  "contact": contact,
                                  "created_at": dNow,
                                  "purpose": {
                                    "academic": academicRes,
                                    "personal": personalRes,
                                    "career": careerRes,
                                    "others": others,
                                  },
                                };

                                ref.add(data);

                                CollectionReference counsellingRef =
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc('counselling')
                                        .collection('counselling');

                                final counsellingData = {
                                  "email": email,
                                  "full_name": fullname,
                                  "home_address": homeAddress,
                                  "contact": contact,
                                  "created_at": dNow,
                                  "purpose": {
                                    "academic": academicRes,
                                    "personal": personalRes,
                                    "career": careerRes,
                                    "others": others,
                                  },
                                };

                                counsellingRef.add(counsellingData);
                                Navigator.of(context).pop();
                              }
                            }
                          : null,
                      child: const Text('Continue'),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 20.0),
                  //   child: Text(
                  //     'I hereby agree that the information shared above are true and correct and that these information can only be used for the sole purpose of this consultation.',
                  //     style: TextStyle(
                  //       fontSize: 12.0,
                  //       color: Colors.red[200],
                  //       letterSpacing: 1.0,
                  //       fontWeight: FontWeight.bold,
                  //       fontStyle: FontStyle.italic,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
