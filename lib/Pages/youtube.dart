import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  const Youtube({
    Key? key,
  }) : super(key: key);

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  late YoutubePlayerController _controller;

  String videoId = 'https://www.youtube.com/watch?v=RYqJ5w-GrfM';

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(videoId) ?? '',
        flags: const YoutubePlayerFlags(
          forceHD: true,
            loop: true,
            hideThumbnail: false,
            showLiveFullscreenButton: true,
            isLive: true,
            autoPlay: true,
            enableCaption: true));
  }

  @override
  void initState() {
    runYouTubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, index) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    _controller.pause();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                  ),
                ),
                title: const Text(
                  'Live Darshan',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              body: index);
        });
  }
}
