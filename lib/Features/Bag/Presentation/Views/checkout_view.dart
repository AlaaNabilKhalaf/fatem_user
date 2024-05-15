import 'package:fatem_users/Core/widgets/background_page.dart';
import 'package:fatem_users/Features/Bag/Presentation/Widgets/bag_widgets.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/bottom_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constance.dart';
import '../../../../Core/widgets/blurred_clipped_button.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';
import '../../../Profile/Presentation/Views/profile_view.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BackgroundPage(
      bottomNavigationBar: const BottomNavigationView(),
      topLeftWidget: const SizedBox(),
      topPosition: 39.h,
      leftPosition: 0.w,
      bodyWidget: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileGradButton(passedWidget: const Bag(), onTap: () {}),
            SizedBox(height: 25.h),
            BlurredClippedButton(
              passedWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'الاسم بالكامل',
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      ' الهاتف',
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      'هاتف اخر',
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      'العنوان',
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      'الملحوظات',
                    ),
                    Container(
                      height: 90,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 60),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xffFFFCEE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('التأكيد'),
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
          ],
        ),
      ),
    );
  }
}
