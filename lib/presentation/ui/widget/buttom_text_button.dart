import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/app_colors.dart';

class BottomTextWithButton extends StatelessWidget {
  const BottomTextWithButton({
    super.key, required this.text, required this.buttonText, required this.onTap,
  });
  final String text;
  final String buttonText;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColors.colorDarkShade900),
        ),
        //SizedBox(width: 0.5.w,),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColors.colorPrimaryShade500,
            ),
          ),
        ),
      ],
    );
  }
}
