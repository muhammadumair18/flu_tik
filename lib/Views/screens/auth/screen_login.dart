import 'package:flu_tik/Views/screens/auth/screen_register.dart';
import 'package:flu_tik/screen_homeScreen.dart';
import 'package:flu_tik/controllers/controller_registration.dart';
import 'package:flu_tik/widegts/custom_button.dart';
import 'package:flu_tik/widegts/custom_inputField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {

  RegistrationController controller = Get.put(RegistrationController(),tag:'login' );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GetX<RegistrationController>(
          tag: 'login',
          builder: (controller) {
            return ModalProgressHUD(
              inAsyncCall: controller.isloading.value,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'TikTok Clone',
                      style: TextStyle(color: Colors.red, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 10.sp,
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
                    SizedBox(
                      height: 10.sp,
                    ),
                    CustomButton(
                      text: 'Login',
                      onPressed: () async{
                        String responce= await controller.signin();
                        if(responce=='success'){
                          Get.offAll(Home());
                        }
                        else{
                          Get.snackbar('Error', responce,colorText: Color(0xffFFFFFF));
                        }

                      },
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t Have An Account? ',
                          style: TextStyle(
                              fontSize: 10.sp, color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(RegisterScreen());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 10.sp, color: Colors.blue),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
