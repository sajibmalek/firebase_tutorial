import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/presentation/ui/screens/home_screen.dart';
import 'package:firebase_tutorial/presentation/ui/screens/signup_screen.dart';
import 'package:firebase_tutorial/presentation/ui/widget/text_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility/app_colors.dart';
import '../utility/app_strings.dart';
import '../widget/buttom_text_button.dart';
import '../widget/text_edit_title.dart';
import '../widget/text_sub_title.dart';
import '../widget/text_top_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _passwordVisible;
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    //signIn();
  }
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.colorPrimaryWhite,
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
              ),
              const Center(
                  child: TextTopTitle(text: AppStrings.signInPageTopTitle)),
              SizedBox(
                height: 8.h,
              ),
              const Center(
                  child:
                  TextSubTitle(text: AppStrings.signInPageSubTopTitle)),
              SizedBox(
                height: 24.h,
              ),
              //your mail text-form flied
              const TextEditFormTitle(
                text: AppStrings.yourEmail,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 47.h,
                child: TextFormField(
                  controller: _emailController,
                  onTapOutside: (event){
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  //controller: _passwordTEController,

                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.only(right: 10, left: 10),
                    border: InputBorder.none,
                    // labelText: AppStrings.passwordType,
                    hintStyle: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w200),
                    hintText: "mail@example.com",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              const TextEditFormTitle(
                text: AppStrings.yourPassword,
              ),
              SizedBox(
                height: 8.h,
              ),
              //your mail text-form flied
              SizedBox(
                width: double.infinity,
                height: 47.h,
                child: TextFormField(
                  controller: _passwordController,
                  onTapOutside: (event){
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  //controller: _passwordTEController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.only(right: 10, left: 10),
                    border: InputBorder.none,

                    suffixIcon: IconButton(
                      icon: Icon(

                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _passwordVisible
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                        size: 20.w,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    // labelText: AppStrings.passwordType,
                    hintStyle: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w200),
                    hintText: "Type a password",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 8.h,
              // ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: TextButton(
              //     onPressed: () {
              //      // Get.to(()=>const EmailVerifyScreen());
              //     },
              //     child: Text('register Now'),
              //   ),
              // ),
              SizedBox(
                height: 14.h,
              ),
              TextElevatedButton(onTap: () async{
                print(_emailController.text);
                print(_passwordController.text);
                signIn();
                SharedPreferences prefs =await SharedPreferences.getInstance();
                prefs.setBool("logedin", true);
              //  Get.offAll(()=>const HomeScreen());
              }, text: AppStrings.continueText),
              SizedBox(
                height: 40.h,
              ),



 
              BottomTextWithButton(text: AppStrings.dontHaveAccount, buttonText: AppStrings.signUp, onTap: () {
                Get.off(()=>const SignUpScreen());
              },)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> signIn()async{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text
        );

        if(_emailController.text.isNotEmpty&& _passwordController.text.isNotEmpty){
          Get.to(()=>HomeScreen());
        }


  }
}
