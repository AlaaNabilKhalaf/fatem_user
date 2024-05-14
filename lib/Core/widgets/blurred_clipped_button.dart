import 'dart:ui';
import 'package:flutter/material.dart';
import 'custom_grad_button.dart';
import 'clipped_shadow_button.dart';




class BlurredClippedButton extends StatelessWidget {

  //Extra
  final Widget passedWidget;
  final Function onTap;

  //Shadow
  final List<BoxShadow>? shadow;
  final double? shadowThickness;
  final double? shadowRadius;
  final double? cutRadius;
  final double? shadowHeight;
  final double? shadowWidth;
  final double? shadowHeightPercentage;
  final bool? shouldClip;

  //Button
  final BoxConstraints? boxConstraints;
  final List<Color> buttonColors;
  final double buttonClipRadius;
  final double sigmaX;
  final double sigmaY;
  final double? buttonHeight;
  final double? buttonWidth;
  final double buttonRadius;


  final bool? hasBorder;
  final bool? withShadow;
  final double? borderWidth;
  final double? borderStrokeAlign;
  final BorderStyle? borderStyle;
  final Color? borderColor;


  const BlurredClippedButton({
    super.key,
    required this.passedWidget,
    required this.onTap,
    required this.buttonColors,
    required this.buttonClipRadius,
    required this.sigmaX,
    required this.sigmaY,
    required this.buttonRadius,
    this.withShadow,
    this.shadow,
    this.shadowRadius,
    this.cutRadius,
    this.shadowHeightPercentage,
    this.shadowHeight,
    this.shadowWidth,
    this.buttonWidth,
    this.buttonHeight,
    this.shouldClip,
    this.shadowThickness,
    this.hasBorder,
    this.borderWidth,
    this.borderStrokeAlign,
    this.borderStyle,
    this.borderColor,
    this.boxConstraints,
  });

  @override
  Widget build(BuildContext context) {

    if(withShadow == true || withShadow == null) {
        return ClippedShadowButton(

          boxShadow: shadow?? [const BoxShadow()],
          shadowHeight: shadowThickness,
          height: shadowHeight,
          width: shadowWidth,
          shadowRadius: shadowRadius ?? 0,
          cutRadius: cutRadius?? 0,
          heightPercentage: shadowHeightPercentage?? 0,
          shouldClip: shouldClip,

          child: ClipRRect(
              borderRadius: BorderRadius.circular(buttonClipRadius),
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: sigmaX,
                  sigmaY: sigmaY,
                ),
                child: GradButton(
                  boxConstraints: boxConstraints,
                  width: buttonWidth,
                  height: buttonHeight,
                  buttonColors: buttonColors,
                  borderRadius: buttonRadius,
                  onTap: onTap,
                  text: passedWidget,
                  border: withBorder()
                ),
              )
          )
      );
    }
    else
      {
        return ClipRRect(
            borderRadius: BorderRadius.circular(buttonClipRadius),
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigmaX,
                sigmaY: sigmaY,
              ),
              child: GradButton(
                  boxConstraints: boxConstraints,
                  width: buttonWidth,
                  height: buttonHeight,
                  buttonColors: buttonColors,
                  borderRadius: buttonRadius,
                  onTap: onTap,
                  text: passedWidget,
                  border: withBorder()
              ),
            )
        );
      }
  }

  Border? withBorder()
  {
    if(hasBorder != null || hasBorder == true)
    {
        return Border.all(
            color : borderColor?? Colors.transparent,
            width: borderWidth?? 0,
            style: borderStyle?? BorderStyle.none,
            strokeAlign: borderStrokeAlign?? 0,
        );
    }

    return null;
  }
}