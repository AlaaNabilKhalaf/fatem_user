import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_logger.dart';


class RegularText extends StatelessWidget {
 const RegularText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.fontFamilyAr,
    required this.fontFamilyEn,
    this.maxLine,
    this.letterSpacing,


  });
  final double fontSize ;
  final double? letterSpacing;
  final String text ;
 final String fontFamilyAr ;
 final String fontFamilyEn ;
  final int? maxLine;
  final Color textColor;
  @override
  Widget build(BuildContext context) {

    return  Text(
      text,
      textAlign: TextAlign.center,
      maxLines: maxLine,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontFamily: fontFamilyFun(fontFamilyAr , fontFamilyEn),
            color: textColor,
      ),
    );
  }
}

String fontFamilyFun(String ar ,String en ){

  return isArabic()? ar : en;


}