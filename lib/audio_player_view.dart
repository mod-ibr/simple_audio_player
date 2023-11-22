import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerView extends StatefulWidget {
  const AudioPlayerView({super.key});

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  final player = AudioPlayer();


  String? filePath = 'sound.mp3';

  bool _play = false;
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('File Recorder'),
        backgroundColor: Colors.white,
        elevation: 4,
      ),
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 10.0,
          ),
          onPressed: () {
            setState(() {
              _play = !_play;
            });
            if (_play) startPlaying();
            if (!_play) stopPlaying();
          },
          icon: _play
              ? const Icon(
                  Icons.stop,
                )
              : const Icon(Icons.play_arrow),
          label: _play
              ? const Text(
                  "Stop Playing",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                )
              : const Text(
                  "Start Playing",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> startPlaying() async {
    player.play(AssetSource(filePath!));
  }

  Future<void> stopPlaying() async {
    player.stop();
  }
}
