import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioFilePage extends StatefulWidget {
  var audioCache;
  final advancePlayer;
  final musicPath;

  AudioFilePage({Key? key, this.advancePlayer, this.audioCache, this.musicPath})
      : super(key: key);

  @override
  State<AudioFilePage> createState() => _AudioFilePageState();
}

class _AudioFilePageState extends State<AudioFilePage> {
  Duration _duration = const Duration();
  Duration _position = const Duration();

  bool isPlaying = false;
  bool isPause = false;
  bool isRepeat = false;
  Color color = Colors.black;

  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    widget.advancePlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    widget.advancePlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    widget.advancePlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = const Duration(seconds: 0);
        if (isRepeat = true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });

    widget.audioCache = AudioCache(fixedPlayer: widget.advancePlayer);
  }

  /// This method call when the advancePlayer and audioCache is done
  @override
  void dispose() {
    super.dispose();

    widget.advancePlayer.dispose();
  }

// Button Slider
  Widget slider() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        value: _position.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

// Button Slow
  Widget slowForwardBtn() {
    return IconButton(
      onPressed: () {
        widget.advancePlayer.setPlaybackRate(0.5);
      },
      icon: SizedBox(
        height: 25.0,
        width: 25.0,
        child: SvgPicture.asset(
          'assets/img/music_therapy/fast-backward.svg',
          color: Colors.grey[800],
        ),
      ),
    );
  }

// Start Button
  Widget btnStart() {
    return IconButton(
      onPressed: () async {
        if (isPlaying == false) {
          final file = await widget.audioCache.loadAsFile(widget.musicPath);
          final bytes = await file.readAsBytes();
          widget.audioCache.playBytes(bytes);
          // widget.audioCache.play(file);
          // widget.advancePlayer.play(path);
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          widget.advancePlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
      icon: isPlaying == false
          ? Icon(
              _icons[0],
              size: 30.0,
            )
          : Icon(
              _icons[1],
              size: 30.0,
            ),
    );
  }

// Fast Forward
  Widget fastForwardBtn() {
    return IconButton(
      onPressed: () {
        widget.advancePlayer.setPlaybackRate(1.5);
      },
      icon: SizedBox(
        height: 25.0,
        width: 25.0,
        child: SvgPicture.asset(
          'assets/img/music_therapy/fast-forward.svg',
          color: Colors.grey[800],
        ),
      ),
    );
  }

// Load Asset
  Widget loadAsset() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        btnStart(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Column(
            // Space between the start timer and end timer
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              slider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // This will split the string and get the first split of the string
                  Text(_position.toString().split(".")[0]),
                  Text(_duration.toString().split(".")[0]),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  slowForwardBtn(),
                  loadAsset(),
                  fastForwardBtn(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

// Convert to Seconds
  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.advancePlayer.seek(newDuration);
  }
}
