import 'package:flutter/cupertino.dart';

class GradButton extends StatelessWidget {
  const GradButton({
    super.key,
    required this.text,
    required this.buttonColors,
    required this.borderRadius,
    required this.onTap,
    this.width,
    this.height,
    this.boxShadow,
    this.border,
    this.boxConstraints
  });

  final Widget text ;
  final double? width;
  final double? height;
  final List<Color> buttonColors ;
  final double borderRadius ;
  final Function onTap;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final BoxConstraints? boxConstraints;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onTap();
      },
      child: Container(
        constraints: boxConstraints,
        alignment: Alignment.center,
        height: height, width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: buttonColors),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
          border: border
        ),
        child: text,
      ),
    );
  }
}
