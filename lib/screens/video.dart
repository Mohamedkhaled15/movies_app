import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  final String video;

  const VideoScreen({super.key, required this.video});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ChewieController? _chewieController;
  late VideoPlayerController videoPlayerController;

  Future initVideo() async {
    videoPlayerController = VideoPlayerController.network(widget.video );
    await videoPlayerController.initialize();

    _chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
      allowFullScreen: true,
      zoomAndPan: true,
      optionsTranslation: OptionsTranslation(subtitlesButtonText: '   '
      )
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initVideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController?.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: _chewieController != null
            ? AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : CircularProgressIndicator(color: Colors.deepOrange),
      ),
    );
  }
}
