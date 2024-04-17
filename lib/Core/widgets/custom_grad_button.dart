import 'package:flutter/cupertino.dart';

class GradButton extends StatelessWidget {
  const GradButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.buttonColors,
    required this.borderRadius,
    required this.onTap,
    this.boxShadow,
    this.border
  });

  final Widget text ;
  final double width;
  final double height;
  final List<Color> buttonColors ;
  final double borderRadius ;
  final Function onTap;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onTap();
      },
      child: Container(
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
