
import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';

class FacebookButton extends StatelessWidget {

  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SvgImage(imagePath: AssetsData.facebookIcon ,height: 10,width: 10, ),
        RegularText(text: s.facebookLogin,fontSize: 15.sp,textColor: Colors.white,fontFamilyAr: arLight,fontFamilyEn: enExtraLight,),
        // SizedBox(width: 10.h,),
      ],
    );
  }
}

class GoogleButton extends StatelessWidget {

  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SvgImage(imagePath: AssetsData.googleIcon , height: 10,width: 12,),
        RegularText(text: s.googleLogin,fontSize: 15.sp,textColor: Colors.white,fontFamilyAr: arLight,fontFamilyEn: enExtraLight,),
        // SizedBox(width: 5.h,),
      ],
    );
  }
}
