import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flu_tik/helpers/constants.dart';
import 'package:flu_tik/models/video.dart';
import 'package:flu_tik/screen_homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  Rx<TextEditingController> captioncontroller = TextEditingController().obs;
  Rx<TextEditingController> songcontroller = TextEditingController().obs;

  uploadvideo(String videopath, File videfil) async {
    if (captioncontroller.value.text.isEmpty ||
        songcontroller.value.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields',
          colorText: Color(0xffFFFFFF));
    } else {
      try {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        print('the uid is is is is is is is is is is is $uid');
        DocumentSnapshot usersnap =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        print('the usersnap is is is is is is is is is is is  $usersnap');
        var alldocs =
            await FirebaseFirestore.instance.collection('videos').get();
        print('the aldocs is is is is is is is is is is is  $alldocs');
        int videolength = alldocs.docs.length;
        print('the videolength is is is is is is is is is is is  $videolength');

        // then((value) {
        //   videolength = value.docs.length;
        // });
        //

        String videolink = await _uploadvideotostorage(
            'video $videolength', videopath, videfil);
        print('the videolink is is is is is is is is is is is  $videolink');
        String thumbnail =
            await _videothumbnailtostorage('video $videolength', videopath);
        print("the thumbnail is is is is is is is is is is is  $thumbnail");
        Video vid = Video(
            username: (usersnap.data() as Map<String, dynamic>)['email'],
            uid: uid,
            id: 'video $videolength',
            likes: [],
            songName: songcontroller.value.text,
            Caption: captioncontroller.value.text,
            thumbnail: thumbnail,
            videourl: videolink,
            profilephoto:
                (usersnap.data() as Map<String, dynamic>)['profilephoto'],
            commentcount: 0,
            sharecount: 0);
        print('the vid is is is is is is is is is is is  $vid');
        await videoref.doc('video $videolength').set(vid.toMap());
        print(
            'Done you video has benn uloadedsdbbsb ajsbflbaslfblabslfjbaljbfljbajlfblabfljb ajbflablfbalbflabfla jabflbalfblabflba kjasfljabflabfla abflabfalbfla akjfblabflbalfbal abfliawbfa'
            'jbajfblabflaasflanalbflablfblabflabflablfba');
      } catch (erroe) {
        print('The error you are getting      $erroe');
        Get.offAll(Home());
        Get.snackbar(
          'Error',
          'Error occured in uploading data $erroe',
          colorText: Color(0xf5000000),
        );
      }
    }
  }

  // _setdatabase(Video video, String len) async {
  //   await videoref.doc(len).set(video.toMap());
  // }

  Future<String> _videothumbnailtostorage(
      String videoname, String videopath) async {
    Reference ref = await FirebaseStorage.instance
        .ref()
        .child('thumbnail')
        .child(videoname);
    UploadTask uploadTask = ref.putFile(await _getthumbnail(videopath));
    TaskSnapshot snap = await uploadTask;
    String _downloadurl = await snap.ref.getDownloadURL();
    return _downloadurl;
  }

  Future<String> _uploadvideotostorage(
      String videoname, String videopath, File videfile) async {
    Reference ref =
        await FirebaseStorage.instance.ref().child('videos').child(videoname);
    // File file=File(await _compressvideo(videopath));
    UploadTask uploadtask = ref.putFile(await _compressvideo(videopath));
    // UploadTask uploadtask =  ref.putFile(videfile);
    TaskSnapshot snap = await uploadtask;
    String _downlaodurl = await snap.ref.getDownloadURL();
    return _downlaodurl;
  }

  _compressvideo(String videopath) async {
    final compressvideo = await VideoCompress.compressVideo(videopath,
        quality: VideoQuality.MediumQuality);
    return compressvideo!.file;
  }

  _getthumbnail(String videopath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videopath);
    return thumbnail;
  }
}
