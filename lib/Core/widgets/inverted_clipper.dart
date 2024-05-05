import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class InvertedClipper extends CustomClipper<Path> {


  InvertedClipper({
    required this.shadowRadius,
    required this.cutRadius,
    required this.heightPercentage,
    this.shouldClip,
    this.shadowHeight
  });

  final double? shadowHeight;
  final double shadowRadius;
  final double cutRadius;
  final double heightPercentage;
  final bool? shouldClip;

  @override
  Path getClip(Size size) {

    final width = size.width;
    final height = size.height;
    final double shadow= shadowHeight?? 0.h;

    return Path.combine(
        PathOperation.difference,
        Path()..addRRect(RRect.fromLTRBR (0, 0, width, height,  Radius.circular(shadowRadius))),
        Path()..addRRect(RRect.fromLTRBR (0, 0, width, (height * heightPercentage) - shadow,  Radius.circular(cutRadius)))
    );
    // Path()
    //   ..addRRect(RRect.fromLTRBR (0, 0, width, height,  Radius.circular(25.w)))
    //   ..addRRect(RRect.fromLTRBR (0, 0, width, height * 0.96,  Radius.circular(25.w)))
    //   ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => shouldClip?? false;
}