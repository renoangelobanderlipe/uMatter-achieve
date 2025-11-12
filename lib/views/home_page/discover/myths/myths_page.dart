import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/controllers/discover_controller/myths_controller_page.dart';

class MythsPage extends StatefulWidget {
  const MythsPage({Key? key}) : super(key: key);

  @override
  State<MythsPage> createState() => _MythsPageState();
}

class _MythsPageState extends State<MythsPage> {
  final controller = MythsControllerPage();

  final flutterTts = FlutterTts();

  Future _speak(desc) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(0.9);
    await flutterTts.speak(desc);
  }

  _stop() async {
    await flutterTts.stop();
  }

  var getCurrentPage = 0;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.grey[500],
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'Depression Myths'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(
            height: 500,
            child: Swiper(
              itemCount: controller.mythsController.length,
              itemWidth: size.width - 2 * 65,
              layout: SwiperLayout.STACK,
              onIndexChanged: (index) async {
                getCurrentPage = index;
              },
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeSize: 15,
                  activeColor: kbtnColor,
                  color: Colors.grey[400],
                  space: 5,
                ),
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 100.0,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 5.0,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 20.0,
                                ),
                                height: size.height * 0.4,
                                width: size.width * 0.7,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      controller.mythsController[index].desc,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.grey[300]),
            child: IconButton(
              onPressed: () async {
                setState(() {
                  isPlaying = !isPlaying;
                });
                if (isPlaying) {
                  _speak(controller.mythsController[getCurrentPage].desc);
                  // print(isPlaying);
                }
                return _stop();
              },
              icon: isPlaying
                  ? const Icon(
                      Icons.mic_rounded,
                      size: 30.0,
                    )
                  : const Icon(Icons.mic_off_rounded),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
