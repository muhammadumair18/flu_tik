import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flu_tik/screen_homeScreen.dart';
import 'package:flu_tik/helpers/constants.dart';
import 'package:flu_tik/models/users.dart' as model;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs,
      passwordController = TextEditingController().obs,
      nameController = TextEditingController().obs;
  RxBool isloading = false.obs;

  XFile? oldpickedimage;
  ImagePicker _imagePicker = ImagePicker();

  void getImage() async {
    XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    oldpickedimage = pickedImage;
    // update();
    Get.snackbar('Image', 'The Image has been selected successfully',colorText: Color(0xffFFFFFF));
    print(pickedImage?.path.toString());
  }

  Future<String> register() async {
    String email = emailController.value.text;
    String password = passwordController.value.text;
    String name = nameController.value.text;
    XFile? regimage = oldpickedimage;
    File file = File(oldpickedimage!.path);
    String autherreor = '';


    if (email.isNotEmpty &&
        password.isNotEmpty &&
        name.isNotEmpty &&
        regimage != null) {
      isloading.value = true;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String url = await _uploadimage(file);
        model.Users user = model.Users(
            name: name, email: email, profilephoto: url, uid: value.user!.uid);
        autherreor = await _setdatabase(user);

      }).catchError((onError) {
        isloading.value = false;
        autherreor = onError.toString();
        Get.snackbar(
          'Error',
          autherreor,
            colorText: Color(0xffFFFFFF)
        );
      });
    }
    else{
      return 'Please fill all the fields';
    }
    return autherreor;
  }




  Future<String> _setdatabase(model.Users user) async {
    String response = '';
    await userref
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(user.toMap())
        .then((value) {
          response='success';
    }).catchError((onError) {
      response = onError.toString();
    });
    return response;
  }

  Future<String> _uploadimage(File image) async {
    Reference ref = await FirebaseStorage.instance
        .ref()
        .child('ProfilePhotos')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String _downloadurl = await snapshot.ref.getDownloadURL();
    return _downloadurl;
  }

Future<String> signin() async{
    String email=emailController.value.text;
    String password=passwordController.value.text;
    String responce = '';

    if(email.isNotEmpty && password.isNotEmpty)
      {
        isloading.value=true;
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password).then((value){
              responce='success';
        }).catchError((onError){
          isloading.value=false;
          responce=onError.toString();
        });
      }
    print(responce);
    return responce;
  }


}
