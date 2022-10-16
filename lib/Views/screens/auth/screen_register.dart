import 'package:flu_tik/screen_homeScreen.dart';
import 'package:flu_tik/Views/screens/auth/screen_login.dart';
import 'package:flu_tik/controllers/controller_registration.dart';
import 'package:flu_tik/widegts/custom_button.dart';
import 'package:flu_tik/widegts/custom_inputField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegistrationController controller = Get.put(RegistrationController(),tag: 'register');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GetX<RegistrationController>(
          tag: 'register',
          builder: (controller) {
            return ModalProgressHUD(inAsyncCall: controller.isloading.value,
              child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.sp,),
                        Text('TikTok Clone',
                          style: TextStyle(color: Colors.red, fontSize: 20.sp),),
                        SizedBox(height: 10.sp,),
                        Text('Regsiter',
                          style: TextStyle(
                              color: Colors.white, fontSize: 15.sp),),
                        SizedBox(height: 10.sp,),
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.13,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.13,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                child: controller.oldpickedimage != null
                                    ? Text(
                                  'Ok', style: TextStyle(color: Colors.black),)
                                    : Text('Fail'),),
                            ),
                            Positioned(
                                bottom: 4,
                                right: 4,
                                child: Container(
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.05,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: InkWell(onTap: () {
                                    controller.getImage();
                                  }, child: Center(child: Icon(Icons.add))),
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 10.sp),
                          child: CustomInputField(
                              controller: controller.emailController.value,
                              ispasswordfield: false,
                              hinttxt: "Email",
                              icon: Icons.email),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 10.sp),
                          child: CustomInputField(
                              controller: controller.passwordController.value,
                              ispasswordfield: true,
                              hinttxt: 'Password',
                              icon: Icons.password),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 10.sp),
                          child: CustomInputField(
                              controller: controller.nameController.value,
                              ispasswordfield: false,
                              hinttxt: 'Name',
                              icon: Icons.drive_file_rename_outline),
                        ),
                        SizedBox(height: 10.sp,),
                        CustomButton(text: 'Login',
                          onPressed: () async{
                          String responce = await controller.register();
                          if(responce=='success'){
                            Get.offAll(Home());
                          }
                          else{
                            Get.snackbar('Error', responce.toString(),colorText: Color(0xffFFFFFF));
                          }
                          },
                          margin: EdgeInsets.symmetric(horizontal: 10.sp),),
                        SizedBox(height: 10.sp,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already Have An Account? ', style: TextStyle(
                                fontSize: 10.sp, color: Colors.white),),
                            InkWell(onTap: () {
                              Get.offAll(LoginScreen());
                            }, child: Text('Login', style: TextStyle(
                                fontSize: 10.sp, color: Colors.blue),),)
                          ],
                        )
                      ],
                    ),
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
