
import 'package:fatem_users/Core/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';

class FacebookButton extends StatelessWidget {

  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10.w,),
        SvgPicture.asset(AssetsData.facebookIcon, width: 50.w,height: 50.h,),
        SizedBox(width: 5.w,),
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 18.w,),
        SvgPicture.asset(AssetsData.googleIcon,width: 30.w,height: 30.h),
        SizedBox(width: 10.w,),
        RegularText(text: s.googleLogin,fontSize: 15.sp,textColor: Colors.white,fontFamilyAr: arLight,fontFamilyEn: enExtraLight,),
        // SizedBox(width: 5.h,),
      ],
    );
  }
}
