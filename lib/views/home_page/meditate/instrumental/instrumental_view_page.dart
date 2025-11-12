import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:umatter/components/app_bar_component.dart';

import '../../../../components/widgets/music_card_widget.dart';

class InstrumentalViewPage extends StatefulWidget {
  final controller;
  final index;
  const InstrumentalViewPage({
    Key? key,
    this.controller,
    this.index,
  }) : super(key: key);

  @override
  State<InstrumentalViewPage> createState() => _InstrumentalViewPageState();
}

class _InstrumentalViewPageState extends State<InstrumentalViewPage> {
  late AudioPlayer advancedPlayer;
  AudioCache audioCache = AudioCache();
  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instrumental',
          style: kAppBarTitle,
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.grey[600],
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: musicCardWidget(
        height: _size.height * 0.30,
        width: double.infinity,
        imgAsset: 'assets/img/music_therapy/music_bg.svg',
        title: widget.controller[widget.index].title,
        author: widget.controller[widget.index].authorName,
        advancedPlayer: advancedPlayer,
        audioCache: audioCache,
        musicPath: widget.controller[widget.index].music,
      ),
    );
  }
}
