import 'package:flu_tik/Views/screens/screen_confirm_video.dart';
import 'package:flu_tik/widegts/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AddVideoScreen extends StatelessWidget {
  _pickvideo(ImageSource src, BuildContext context) async {
    XFile? video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConfirmVideoScreen(
                  videofile: video, videopath: video.path)));
    }
  }

  showoptionDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              backgroundColor: Colors.black,
              children: [
                SimpleDialogOption(
                  onPressed: () {_pickvideo(ImageSource.gallery, context);},
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
                    child: Row(
                      children: [
                        Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          'Open Gallery',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {_pickvideo(ImageSource.camera, context);},
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          'Open Camera',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
                    child: Row(
                      children: [
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          'Cancel',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showoptionDialog(context);
          },
          child: Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
            child: Text(
              'Add Video',
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
            ),
          ),
        ),
      ),
    );
  }
}
