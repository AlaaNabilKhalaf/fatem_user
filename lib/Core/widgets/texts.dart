import 'package:flutter/cupertino.dart';


class RegularText extends StatelessWidget {
  const RegularText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.fontFamily,
    this.maxLine,
    this.letterSpacing,

  });
  final double fontSize ;
  final double? letterSpacing;
  final String text ;
  final String fontFamily ;
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
        fontFamily: fontFamily,
            color: textColor,
      ),
    );
  }
}

