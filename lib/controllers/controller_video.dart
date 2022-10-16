import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flu_tik/helpers/constants.dart';
import 'package:flu_tik/models/video.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  final vides = List<Video>.empty(growable: true).obs;

  @override
  void onInit() {
    vides.bindStream(getvideos());
    super.onInit();
  }

  Stream<List<Video>> getvideos() {
    Stream<QuerySnapshot> snaps = videoref.snapshots();

    return snaps.map((querysnapshots) => querysnapshots.docs
        .map((e) => Video.fromMap(e.data() as Map<String, dynamic>))
        .toList());
  }
}
