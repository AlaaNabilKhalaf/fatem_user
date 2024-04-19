import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ClippedShadowButton.dart';
import 'custom_grad_button.dart';







class BlurredClippedButton extends StatelessWidget {

  //Extra
  final Widget passedWidget;
  final Function onTap;

  //Shadow
  final List<BoxShadow> shadow;
  final double? shadowThickness;
  final double shadowRadius;
  final double cutRadius;
  final double shadowHeight;
  final double shadowWidth;
  final double shadowHeightPercentage;
  final bool? shouldClip;

  //Button
  final List<Color> buttonColors;
  final double buttonClipRadius;
  final double sigmaX;
  final double sigmaY;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonRadius;


  final bool? hasBorder;
  final double? borderWidth;
  final double? borderStrokeAlign;
  final BorderStyle? borderStyle;
  final Color? borderColor;



  const BlurredClippedButton({
    super.key,
    required this.passedWidget,
    required this.onTap,
    required this.shadow,
    required this.shadowRadius,
    required this.cutRadius,
    required this.shadowHeight,
    required this.shadowWidth,
    required this.shadowHeightPercentage,
    required this.buttonColors,
    required this.buttonClipRadius,
    required this.sigmaX,
    required this.sigmaY,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonRadius,
    this.shouldClip,
    this.shadowThickness,
    this.hasBorder,
    this.borderWidth,
    this.borderStrokeAlign,
    this.borderStyle,
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {

    return ClippedShadowButton(
        boxShadow: shadow,
        shadowHeight: shadowThickness,
        height: shadowHeight,
        width: shadowWidth,
        shadowRadius: shadowRadius,
        cutRadius: cutRadius,
        heightPercentage: shadowHeightPercentage,
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