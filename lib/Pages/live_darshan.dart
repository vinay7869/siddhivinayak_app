import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  late YoutubePlayerController _controller;
  late String preUrl = "https://www.youtube.com/watch?v=";
  late String videoId = '${preUrl}JHTweaSqW7g';

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoId) ?? '',
      flags: const YoutubePlayerFlags(
        forceHD: true,
        loop: true,
        hideThumbnail: false,
        showLiveFullscreenButton: true,
        isLive: true,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    runYouTubePlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, index) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('YouTube Player',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: index,
        );
      },
    );
  }
}
