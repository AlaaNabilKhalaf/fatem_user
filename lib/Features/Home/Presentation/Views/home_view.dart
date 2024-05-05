import 'package:fatem_users/Core/utils/app_logger.dart';
import 'package:fatem_users/Core/widgets/background_page.dart';
import 'package:fatem_users/Features/Home/Presentation/Widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';
import 'bottom_navigation_view.dart';




class HomeView extends StatelessWidget
{
  const HomeView({super.key});



  @override
  Widget build(BuildContext context)
  {
    final s = S.of(context);

    return BackgroundPage
      (
        topPosition: 34.h,
        leftPosition: 24.w,
        bottomNavigationBar: const BottomNavigationView(),

        topLeftWidget: SizedBox(
          width: 167.w,
          height: 70.h,
          child: RegularText(
            textDirection: TextDirection.ltr,
            fontSizeAr: 17.sp,
            text: "BEGIN YOUR BEAUTY JOURNEY",
            fontSizeEn: 17.sp,
            textColor: Colors.black,
            fontFamilyAr: enExtraLight,
            fontFamilyEn: enExtraLight,
            textAlign: TextAlign.start,
            letterSpacing: 2,
          )
        ),


        bodyWidget: Column(
          children: [
            SizedBox(height: isArabic()? 138.h : 156.h),

            const WelcomeMessage(),

            SizedBox(height: 17.h),

            const BlurredRectangle(),

            SizedBox(height: 30.h),

            RegularText(
                fontSizeAr: 35.sp,
                text: s.bestSelling, fontSizeEn: 26.sp, textColor: Colors.black, fontFamilyAr: arBold, fontFamilyEn: ade, letterSpacing: 6,),

            SizedBox(height: 16.h),

            const Expanded(
                child: CardsGrid()
            ),
          ],
        )
    );
  }

}