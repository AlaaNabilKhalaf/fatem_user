import 'package:flutter/cupertino.dart';
import '../utils/app_logger.dart';


class RegularText extends StatelessWidget {
 const RegularText({
    super.key,
    required this.text,
    required this.fontSizeEn,
    required this.textColor,
    required this.fontFamilyAr,
    required this.fontFamilyEn,
    required this.fontSizeAr,
    this.maxLine,
    this.letterSpacing,
    this.textAlign,
    this.textDirection
  });

  final double fontSizeEn ;
  final double fontSizeAr ;
  final double? letterSpacing;
  final String text ;
  final String fontFamilyAr ;
  final String fontFamilyEn ;
  final int? maxLine;
  final Color textColor;
  final TextAlign? textAlign;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {

    return  Text(
      text,
      textAlign: textAlign?? TextAlign.center,
      maxLines: maxLine,
      textDirection: textDirection,
      style: TextStyle(
        letterSpacing: letterSpacingChecking(letterSpacing),
        fontSize: fontSizeFun(fontSizeAr , fontSizeEn),
        fontFamily: fontFamilyFun(fontFamilyAr , fontFamilyEn),
            color: textColor,
      ),
    );
  }
}

String fontFamilyFun(String ar ,String en ){

  return isArabic()? ar : en;


}


double fontSizeFun(double ar ,double en ){

  return isArabic()? ar : en;
}


double? letterSpacingChecking(double? letterSpacing){
  return isArabic()? null : letterSpacing;
}