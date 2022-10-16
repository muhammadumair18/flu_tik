import 'dart:io';

import 'package:flu_tik/Views/screens/screen_add_video.dart';
import 'package:flu_tik/controllers/controller_upload_video.dart';
import 'package:flu_tik/screen_homeScreen.dart';
import 'package:flu_tik/widegts/custom_inputField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class ConfirmVideoScreen extends StatefulWidget {
  XFile videofile;
  String videopath;

  ConfirmVideoScreen({
    required this.videofile,
    required this.videopath,
  });

  @override
  State<ConfirmVideoScreen> createState() => _ConfirmVideoScreenState();
}

class _ConfirmVideoScreenState extends State<ConfirmVideoScreen> {
  UploadVideoController uploadVideoController =
  Get.put(UploadVideoController());

  

  late VideoPlayerController _controller;

  late File fv;

  @override
  void initState() {
    fv=File(widget.videofile.path);
    File file = File(widget.videofile.path);
    _controller = VideoPlayerController.file(file);
    _controller.initialize();
    _controller.play();
    _controller.setVolume(1);
    _controller.setLooping(true);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: VideoPlayer(_controller),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 5.sp),
                        child: CustomInputField(
                            controller: uploadVideoController
                                .songcontroller.value,
                            ispasswordfield: false,
                            hinttxt: "Song Name",
                            icon: Icons.music_note)),
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 5.sp),
                        child: CustomInputField(
                            controller: uploadVideoController
                                .captioncontroller.value,
                            ispasswordfield: false,
                            hinttxt: "Caption",
                            icon: Icons.closed_caption)),
                    GestureDetector(
                      onTap: () async{
                        await uploadVideoController.uploadvideo(
                            widget.videopath,
                        fv);
                        Get.offAll(Home());
                      },
                      child: Container(
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 5.sp),
                        child: Text(
                          'Add Video',
                          style:
                          TextStyle(color: Colors.white, fontSize: 10.sp),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
