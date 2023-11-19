import 'package:firebase_tutorial/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextTopTitle extends StatelessWidget {
  const TextTopTitle({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign: TextAlign.center,style: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.colorDarkShade800
    ),);
  }
}
