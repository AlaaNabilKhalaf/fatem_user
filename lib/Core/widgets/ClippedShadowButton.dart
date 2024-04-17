import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadow_clip/shadow_clip.dart';
import 'InvertedClipper.dart';



class ClippedShadowButton extends StatelessWidget {

  const ClippedShadowButton({
    super.key,
    required this.boxShadow,
    required this.height,
    required this.width,
    required this.shadowRadius,
    required this.cutRadius,
    required this.heightPercentage,
    this.child,
    this.shadowHeight,
    this.shouldClip
  });



  final double? shadowHeight; //3.h,
  final double shadowRadius; //25.w,
  final double cutRadius; //18.w,
  final double heightPercentage; //0.97,
  final double width;  //294.w
  final double height; //65.h
  final bool? shouldClip; //true
  final List<BoxShadow> boxShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children:
      [
        IgnorePointer(
          ignoring: true,
          child: ClipShadow(
              boxShadow: boxShadow,
              clipper: InvertedClipper(
                  shadowHeight: shadowHeight,
                  shadowRadius: shadowRadius,
                  cutRadius: cutRadius,
                  heightPercentage: heightPercentage,
                  shouldClip: shouldClip
              ),
              child: Container(
                alignment: Alignment.center,
                height: height,
                width: width,
              )
          ),
        ),
        child?? const SizedBox(),
      ],
    );
  }
}