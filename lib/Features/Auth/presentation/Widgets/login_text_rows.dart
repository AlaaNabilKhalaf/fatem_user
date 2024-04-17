
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 30.w,),
        SvgImage(imagePath: AssetsData.facebookIcon ,height: 22.h,width: 22.w, ),
        SizedBox(width: 13.w,),
        RegularText(fontSizeAr: 18.sp,text: s.facebookLogin,fontSizeEn: 14.sp,textColor: Colors.white,fontFamilyAr: arRegular,fontFamilyEn: enLight,),
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
        SizedBox(width: 30.w,),
        SvgImage(imagePath: AssetsData.googleIcon , height: 22.h,width: 22.w,),
        SizedBox(width: 13.w,),
        RegularText(fontSizeAr:18.sp,text: s.googleLogin,fontSizeEn: 15.sp,textColor: Colors.white,fontFamilyAr: arRegular,fontFamilyEn: enLight,),
        // SizedBox(width: 5.h,),
      ],
    );
  }
}
