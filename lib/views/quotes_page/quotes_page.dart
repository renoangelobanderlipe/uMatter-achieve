import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final int randomRes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('json/quotes.json'),
        builder: ((context, snapshot) {
          var jsonData = json.decode(snapshot.data.toString());

          /// This Method used to randomize the return data to the PageView.builder()
          // randomData(jsonData);
          // print(randomData(jsonData));
          return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jsonData.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(randomData(jsonData)),
                          Align(
                            widthFactor: 15.0,
                            alignment: Alignment.topLeft,
                            child: FaIcon(
                              FontAwesomeIcons.quoteLeft,
                              color: Colors.grey[500],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            // Quotes
                            child: Text(
                              jsonData[randomData(jsonData)]['text'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 20.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            widthFactor: 15.0,
                            alignment: Alignment.bottomRight,
                            child: FaIcon(FontAwesomeIcons.quoteRight,
                                color: Colors.grey[500]),
                          ),
                          const SizedBox(height: 40.0),
                          Text(
                            // Author
                            "-- " +
                                jsonData[randomData(jsonData)]['author'] +
                                " --",
                            // style: Theme.of(context).textTheme.headline6,
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14.0),
                          )
                        ]));
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async => setState(() {}),
          child: const Icon(Icons.refresh),
          backgroundColor: kPrimaryFrmColor),
    );
  }

  randomData(jsonData) {
    var rand = Random();

    int randomNum = 0;

    for (var i = 0; i < jsonData.length; i++) {
      randomNum = rand.nextInt(jsonData.length);
    }
    // randomRes = randomNum;
    // print(randomNum);
    return randomNum;
  }
}
