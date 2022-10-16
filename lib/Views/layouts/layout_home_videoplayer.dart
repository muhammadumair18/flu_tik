import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LayoutHomeVideoPlayer extends StatefulWidget {

  String url;

  @override
  _LayoutHomeVideoPlayerState createState() => _LayoutHomeVideoPlayerState();

  LayoutHomeVideoPlayer({
    required this.url,
  });
}

class _LayoutHomeVideoPlayerState extends State<LayoutHomeVideoPlayer> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller=VideoPlayerController.network(widget.url);
    _controller.initialize().then((value) {
      _controller.play();
      _controller.setVolume(1);
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _controller.pause();
      },
      child: Container(
        height: Get.height,
        width: Get.width,
        child: VideoPlayer(_controller),
      ),
    );
  }
}
