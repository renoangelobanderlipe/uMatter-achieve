import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/my_diary/page/select_emotion.dart';
import 'package:umatter/views/home_page/my_diary/page/view_diary_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class MyDiaryPage extends StatefulWidget {
  const MyDiaryPage({Key? key}) : super(key: key);

  @override
  _MyDiaryPageState createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');
  final ktextStyle = const TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    letterSpacing: 1.0,
  );
  // CollectionReference emojiRef = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc('emotions')
  //     .collection('');

  final keyOne = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  final textStyle = const TextStyle(fontSize: 25.0);

  final emotions = [
    "😄",
    "😭",
    "😎",
    "😍",
    "😱",
    "😴",
    "🤔",
    "😔",
    "🙁",
    "😡",
    "😇",
    "😥",
    "🤤"
  ];

  var emotionsList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Journal', style: kAppBarTitle),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[700],
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[100],
        body: StreamBuilder<QuerySnapshot>(
          stream: ref.snapshots(),
          builder: (context, snapshot) {
            List sample = [];
            List temparr = [];

            // Get the data from the firestore
            snapshot.data?.docs.forEach((doc) {
              sample.add(doc.data());
            });

            // Get the emotions and store it to the tempaar
            for (var temp in sample) {
              temparr.add(temp['emotions']);
            }
            // temparr.sort();
            // print(temparr);

            // if (temparr != null && temparr.isNotEmpty) {
            //   temparr.sort((a, b) => a.compareTo(b));
            //   print(temparr.last);
            // }

// Happy, Crying, Cool,Love, Shock, Sleepy, Thinking, Tired,Lonely, Blessed, Angry,Blessed, Exhausted, Drooling
            // var counts = {};
            // temparr.map((x) {
            //   counts[x] = (counts[x] || 0) + 1;
            //   print(x);
            // });

            var map = Map();

            temparr.forEach(
              (x) {
                map[x] = !map.containsKey(x) ? (1) : (map[x] + 1);
              },
            );
            var total = [];
            var res = [];
            map.forEach((f, k) {
              total.add(k);
              res.add(f);
            });
            // print(total);
            var large = total[0];
            var total_res;
            for (var i = 0; i < total.length; i++) {
              if (total[i] >= large) {
                total_res = total[i];
              }
            }
            print(total_res);
            var mostUsedEmotion;
            var finalShit;
            map.forEach((f, k) {
              if (k == total_res) {
                mostUsedEmotion = f;
              }
            });
            // print(mostUsedEmotion);
            mostUsed(mostUsedEmotion ?? "");
            // print(large.runtimeType);

            // print(map);

            // temparr.forEach((data) {
            //   counts[data] = (counts[data] || 0) + 1;
            // });
            // print(counts);
            // for (var arr in temparr) {
            //   print(arr);
            // }
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/img/diary/no_notes.svg',
                        height: 200.0,
                        width: 200.0,
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Empty Diary",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  // This will automatically refresh the page once the use saved the diary.
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    children: [
                      // getEmojiData(),
                      //
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Notes',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${snapshot.data?.docs.length}",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Most used emotions',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                mostUsed(mostUsedEmotion),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            Map? data =
                                snapshot.data!.docs[index].data() as Map?;
                            DateTime dateTime = data!['created'].toDate();
                            String formattedDatetime =
                                DateFormat.yMMMd().add_jm().format(dateTime);
                            selectedEmoji(data);

                            data['emotions'];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: InkWell(
                                      splashFactory: NoSplash.splashFactory,
                                      onTap: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                            builder: (context) => ViewDiaryPage(
                                              data: data,
                                              time: formattedDatetime,
                                              ref: snapshot
                                                  .data!.docs[index].reference,
                                              emotion:
                                                  SharePrefConfig.getEmoji()
                                                      ?.toString(),
                                            ),
                                          ))
                                          .then((value) => setState(() {})),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 30.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Create at (time)
                                                Text(
                                                  formattedDatetime
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey[400],
                                                    letterSpacing: 0.7,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),

                                                // Emoji
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    color: Colors.grey[200],
                                                  ),
                                                  child: selectedEmoji(data),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${data['title']}",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.grey[400],
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.0,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15.0,
                                            ),

                                            // Note description
                                            SizedBox(
                                              height: 20.0,
                                              child: Text(
                                                "${data['description']}",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryFrmColor,
          tooltip: "Create Diary",
          child: const FaIcon(
            FontAwesomeIcons.featherAlt,
            // color: Colors.black,
          ),
          onPressed: () => Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const EmojiSelectorPage(),
            ),
          )
              .then(
            (value) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  selectedEmoji(data) {
    if (data['emotions'] == "Happy") {
      return Text(emotions[0], style: textStyle);
    } else if (data['emotions'] == "Crying") {
      return Text(emotions[1], style: textStyle);
    } else if (data['emotions'] == "Cool") {
      return Text(emotions[2], style: textStyle);
    } else if (data['emotions'] == "Love") {
      return Text(emotions[3], style: textStyle);
    } else if (data['emotions'] == "Shock") {
      return Text(emotions[4], style: textStyle);
    } else if (data['emotions'] == "Sleepy") {
      return Text(emotions[5], style: textStyle);
    } else if (data['emotions'] == "Thinking") {
      return Text(emotions[6], style: textStyle);
    } else if (data['emotions'] == "Tired") {
      return Text(emotions[7], style: textStyle);
    } else if (data['emotions'] == "Lonely") {
      return Text(emotions[8], style: textStyle);
    } else if (data['emotions'] == "Angry") {
      return Text(emotions[9], style: textStyle);
    } else if (data['emotions'] == "Blessed") {
      return Text(emotions[10], style: textStyle);
    } else if (data['emotions'] == "Exhausted") {
      return Text(emotions[11], style: textStyle);
    } else if (data['emotions'] == "Drooling") {
      return Text(emotions[12], style: textStyle);
    }
  }

  mostUsed(data) {
    if (data == "Happy") {
      return Text(emotions[0], style: textStyle);
    } else if (data == "Crying") {
      return Text(emotions[1], style: textStyle);
    } else if (data == "Cool") {
      return Text(emotions[2], style: textStyle);
    } else if (data == "Love") {
      return Text(emotions[3], style: textStyle);
    } else if (data == "Shock") {
      return Text(emotions[4], style: textStyle);
    } else if (data == "Sleepy") {
      return Text(emotions[5], style: textStyle);
    } else if (data == "Thinking") {
      return Text(emotions[6], style: textStyle);
    } else if (data == "Tired") {
      return Text(emotions[7], style: textStyle);
    } else if (data == "Lonely") {
      return Text(emotions[8], style: textStyle);
    } else if (data == "Angry") {
      return Text(emotions[9], style: textStyle);
    } else if (data == "Blessed") {
      return Text(emotions[10], style: textStyle);
    } else if (data == "Exhausted") {
      return Text(emotions[11], style: textStyle);
    } else if (data == "Drooling") {
      return Text(emotions[12], style: textStyle);
    }
  }

  getEmojiData() {
    StreamBuilder(
      stream: ref.snapshots(),
      builder: (context, snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Notes',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'as',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Most used emotions',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "",
                    // '😄',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
