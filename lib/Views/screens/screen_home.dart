import 'package:flu_tik/Views/layouts/layout_home_videoplayer.dart';
import 'package:flu_tik/controllers/controller_video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  VideoController _controller = Get.put(VideoController(), tag: 'Homescreen');




  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      assignId: true,
      tag: 'Homescreen',
      builder: (logic) {
        return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _controller.vides.length,
            itemBuilder: (context, index) {
              final data = _controller.vides[index];
              return Stack(children: [
                LayoutHomeVideoPlayer(url: data.videourl),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.username,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        Text(
                          '♩ ${data.songName}',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        Text(
                          data.Caption,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 24.sp,
                              )),
                          Text(
                            data.likes.length.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.comment,
                                color: Colors.white,
                                size: 25.sp,
                              )),
                          Text(
                            data.commentcount.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 25.sp,
                              )),
                          Text(
                            '2',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ))
              ]);
            });
      },
    );
  }
}
