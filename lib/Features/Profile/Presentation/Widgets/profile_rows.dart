import 'package:fatem_users/Core/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/utils/app_logger.dart';
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        SizedBox(width: 20.w),

        CircleAvatar(
          radius: 17.5.w,
          backgroundColor: Colors.black,
          child:  Padding(
            padding: EdgeInsets.all(1.5.w),
            child: ClipOval(
              child: Image.network(
                avatar!,
                isAntiAlias: true,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        SizedBox(width: 7.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 16.h),
            RegularText(
                fontSizeAr: 14.sp,
                text: name!, fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),

            RegularText(
                fontSizeAr: 9.sp,
                text: email!, fontSizeEn: 9.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular)
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
        SvgPicture.asset(AssetsData.previousOrders, width: 38.w,height: 38.h),
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
        SvgPicture.asset(AssetsData.language, width: 35.w,height: 35.h),
        SizedBox(width: 15.w,),
        RegularText(
            fontSizeAr: 16.sp,
            text: s.languagesText, fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight),
        SizedBox(width: 65.w,),
        extraSizedBox(80.w),
        RegularText(
            fontSizeAr: 9.sp,
            text: s.currentLanguage, fontSizeEn: 9.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enExtraLight),
      ],
    );
  }


  Widget extraSizedBox(double width){
    return isArabic()? SizedBox(width: width) : const SizedBox();
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