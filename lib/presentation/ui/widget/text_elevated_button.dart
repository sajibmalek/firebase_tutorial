import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/app_colors.dart';

class TextElevatedButton extends StatelessWidget {
  const TextElevatedButton({super.key, required this.onTap, required this.text});
  final String text;
    final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(onPressed: onTap, child: Text(text,style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color:AppColors.colorPrimaryWhite
      ),)),
    );
  }
}
