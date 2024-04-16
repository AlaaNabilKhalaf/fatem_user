import 'package:fatem_users/Core/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';




class ProfileButton extends StatelessWidget{
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RegularText(
            fontSizeAr: 31.sp,
            text: s.profileText, fontSizeEn: 31.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}

class Account extends StatelessWidget{
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ///SvgPicture.network(avatar!),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RegularText(
                fontSizeAr: 14.sp,
                text: name!, fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight),
            RegularText(
                fontSizeAr: 9.sp,
                text: email!, fontSizeEn: 9.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enExtraLight)
          ],
        ),
      ],
    );
  }
}



class PreviousOrders extends StatelessWidget{
  const PreviousOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.w,),
        SvgPicture.asset(AssetsData.previousOrders, width: 50.w,height: 50.h),
        SizedBox(width: 15.w,),
        RegularText(
            fontSizeAr: 16.sp,
            text: s.previousOrdersText, fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}


class Languages extends StatelessWidget{
  const Languages({super.key});
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.w,),
        SvgPicture.asset(AssetsData.language, width: 50.w,height: 50.h),
        SizedBox(width: 15.w,),
        RegularText(
            fontSizeAr: 16.sp,
            text: s.languagesText, fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight),
        SizedBox(width: 65.w,),
        RegularText(
            fontSizeAr: 9.sp,
            text: s.currentLanguage, fontSizeEn: 9.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enExtraLight)
      ],
    );
  }

}


class LogOut extends StatelessWidget{
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RegularText(
            fontSizeAr: 17.sp,
            text: s.logOut, fontSizeEn: 17.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enLight),
      ],
    );
  }

}