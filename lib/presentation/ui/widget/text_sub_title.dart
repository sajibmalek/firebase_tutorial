import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/app_colors.dart';

class TextSubTitle extends StatelessWidget {
  const TextSubTitle({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign: TextAlign.center,style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.colorDarkShade800
    ),);
  }
}
