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


  });
 final double fontSizeEn ;
 final double fontSizeAr ;
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
