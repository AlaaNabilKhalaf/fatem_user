import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';





class PreviousOrdersCenter extends StatelessWidget{
  const PreviousOrdersCenter({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RegularText(
            fontSizeAr: 29.sp,
            text: s.previousOrdersText, fontSizeEn: 21.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}


class NoPreviousOrders extends StatelessWidget
{
  const NoPreviousOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 200.w,
            height: 184.h,
            child: Image.asset(AssetsData.noOrders, fit: BoxFit.contain,)),
        SizedBox(height: 4.h),
        RegularText(
            fontSizeAr: 23.sp,
            text: s.noPreviousOrders, fontSizeEn: 17.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
  
}