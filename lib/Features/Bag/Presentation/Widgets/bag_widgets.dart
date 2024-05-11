import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';





class Bag extends StatelessWidget{
  const Bag({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RegularText(
            fontSizeAr: 31.sp,
            text: s.bag, fontSizeEn: 31.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}


class BagEmpty extends StatelessWidget
{
  const BagEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 127.w,
            height: 145.h,
            child: Image.asset(AssetsData.emptyBag, fit: BoxFit.contain,)),
        SizedBox(height: 12.h),
        RegularText(
            fontSizeAr: 23.sp,
            text: s.noPreviousOrders,
            fontSizeEn: 15.sp,
            textColor: Colors.black,
            fontFamilyAr: arRegular,
            fontFamilyEn: enLight,
            maxLine: 3,
            textOverflow: TextOverflow.visible,
        )
      ],
    );
  }
}