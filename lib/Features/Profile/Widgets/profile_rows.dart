import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Features/Auth/presentation/Controller/AuthLocal/auth_cache_network.dart';
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
        RegularText(text: s.profileText, fontSize: 22.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular)
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
        SvgPicture.network(avatar!),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RegularText(text: name!, fontSize: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
            RegularText(text: email!, fontSize: 8.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enLight)
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
        RegularText(text: s.previousOrdersText, fontSize: 14.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enLight)
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
        RegularText(text: s.languagesText, fontSize: 14.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enLight),
        SizedBox(width: 65.w,),
        RegularText(text: s.currentLanguage, fontSize: 8.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enLight)
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
        RegularText(text: s.logOut, fontSize: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
      ],
    );
  }

}