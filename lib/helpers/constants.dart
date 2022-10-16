import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flu_tik/Views/screens/screen_add_video.dart';
import 'package:flu_tik/Views/screens/screen_home.dart';
import 'package:flu_tik/Views/screens/screen_messages.dart';
import 'package:flu_tik/Views/screens/screen_profile.dart';
import 'package:flu_tik/Views/screens/screen_search.dart';

CollectionReference userref = FirebaseFirestore.instance.collection('users');
CollectionReference videoref = FirebaseFirestore.instance.collection('videos');

List pages = [
  HomeScreen(),
  SearchScreen(),
  AddVideoScreen(),
  MessagesScreen(),
  ProfileScreen()
];
