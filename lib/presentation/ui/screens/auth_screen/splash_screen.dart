import 'package:firebase_tutorial/presentation/ui/screens/home_screen.dart';
import 'package:firebase_tutorial/presentation/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Splash Screen'),
    );
  }

  Future<void> gotoLogin()async{

  Future.delayed(Duration(seconds: 1)).then((value) async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    final check=   prefs.getBool('logedin')?? false;

    Get.offAll(check?const HomeScreen():const LoginScreen());
  });
  }
}
