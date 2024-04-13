import 'package:flutter/cupertino.dart';


class RegularText extends StatelessWidget {
  const RegularText({
    super.key,
    required this.fontSize,
    required this.text,
    this.maxLine,
    required this.textColor,
    required this.fontFamily
  });
  final double fontSize ;
  final String text ;
  final String fontFamily ;
  final int? maxLine;
  final Color textColor;
  @override
  Widget build(BuildContext context) {

    return  Text(text,
      textAlign: TextAlign.center,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
            color: textColor,
      ),
    );
  }
}

