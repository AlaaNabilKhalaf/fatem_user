import 'package:fatem_users/Core/utils/app_logger.dart';
import 'package:fatem_users/Core/widgets/background_page.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/bottom_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../Core/constance.dart';
import '../../../../Core/widgets/blurred_clipped_button.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';
import '../../../Profile/Presentation/Views/profile_view.dart';
import '../Widgets/pay.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  alert(BuildContext context){
    final lang = S.of(context);
    return    Alert(
      context: context,
      style: AlertStyle(
        // buttonsDirection: ButtonsDirection.row,
alertBorder: Border.all(
  style: BorderStyle.solid,
  color: bottomNaviBarBorderColor,
  width: 2
),
        backgroundColor: gradColor[1],
        isCloseButton: false,
isButtonVisible: false
      ),
      desc: "",
      content: Center(
        child:  SizedBox(
          child: RegularText(
            textColor: Colors.black,
            text: lang.orderIsSent,
            fontSizeEn: 25,
              fontFamilyAr: arRegular,
          fontFamilyEn: arRegular,
          fontSizeAr: 25,),
        ),
      )

    ).show();
  }
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return BackgroundPage(
      bottomNavigationBar: const BottomNavigationView(),
      topLeftWidget: const SizedBox(),
      topPosition: 39.h,
      leftPosition: 0.w,
      bodyWidget: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileGradButton(passedWidget: const Pay(), onTap: () {}),
            SizedBox(height: 25.h),
            Directionality(
              textDirection: isArabic()? TextDirection.ltr : TextDirection.rtl ,
              child: BlurredClippedButton(
                passedWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,
                  vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                   RegularText(text: lang.fullName, fontSizeEn: 19, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: arRegular, fontSizeAr: 19),
                      Container(
                        height: 35,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      RegularText(text: lang.phone, fontSizeEn: 19, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: arRegular, fontSizeAr: 19),

                      Container(
                        height: 35,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      RegularText(text: lang.otherPhone, fontSizeEn: 19, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: arRegular, fontSizeAr: 19),

                      Container(
                        height: 35,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      RegularText(text: lang.address, fontSizeEn: 19, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: arRegular, fontSizeAr: 19),

                      Container(
                        height: 35,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      RegularText(text: lang.notes, fontSizeEn: 19, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: arRegular, fontSizeAr: 19),

                      Container(
                        height: 90,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                  alert(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin:
                              const EdgeInsets.symmetric(vertical: 2, horizontal: 60),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFCEE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                          RegularText(text: lang.confirm, fontSizeEn: 19, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: arRegular, fontSizeAr: 19),

                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
                shadow: shadow,
                shadowRadius: 25.r,
                cutRadius: 22.r,
                shadowHeight: 510.h,
                shadowWidth: 294.w,
                shadowHeightPercentage: 0.978,
                shouldClip: true,
                buttonColors: [
                  gradColor[0].withOpacity(0.4),
                  gradColor[1].withOpacity(0.4)
                ],
                buttonClipRadius: 25.w,
                sigmaX: 2,
                sigmaY: 2,
                buttonHeight: 495.h,
                buttonWidth: 295.w,
                buttonRadius: 25.r,
                hasBorder: true,
                borderWidth: 1.w,
                borderStyle: BorderStyle.solid,
                borderColor: const Color(0xfffeefdf),
                borderStrokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
