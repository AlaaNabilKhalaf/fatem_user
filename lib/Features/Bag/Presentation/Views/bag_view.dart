import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/widgets/blurred_clipped_button.dart';
import '../../../../Core/widgets/background_page.dart';
import '../../../Home/Presentation/Views/bottom_navigation_view.dart';
import '../../../Profile/Presentation/Views/profile_view.dart';
import '../Widgets/bag_widgets.dart';

class BagView extends StatelessWidget {
  const BagView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      bottomNavigationBar: BottomNavigationView(),
      topPosition: 39.h,
      leftPosition: 0.w,
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileGradButton(passedWidget: const Bag(), onTap: () {}),

          SizedBox(height: 25.h),

          BlurredClippedButton(
            passedWidget: const BagEmpty(),
            onTap: () {},
            shadow: shadow,
            shadowRadius: 25.w,
            cutRadius: 22.w,
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
            buttonRadius: 25.w,
            hasBorder: true,
            borderWidth: 1.w,
            borderStyle: BorderStyle.solid,
            borderColor: const Color(0xfffeefdf),
            borderStrokeAlign: BorderSide.strokeAlignInside,
          ),

          // BlurredClippedButton(
          //     passedWidget: const BottomNavigationView(),
          //     onTap: (){},
          //     shadow: [],
          //     shadowRadius: 8.w,
          //     cutRadius: 2.w,
          //     shadowHeight: 62.h,
          //     shadowWidth: 300.w,
          //     shadowHeightPercentage: 0.9,
          //     buttonColors: [bottomNaviBarColor, const Color(0xff886552).withOpacity(0)],
          //     buttonClipRadius: 8.w,
          //     sigmaX: 2, sigmaY: 2,
          //     buttonHeight: 62.h,
          //     buttonWidth: 300.w,
          //     buttonRadius: 8.w,
          //     hasBorder: true,
          //     borderWidth: 1.w,
          //     borderStyle: BorderStyle.solid,
          //     borderColor: const Color(0xff886552).withOpacity(0.6),
          //     borderStrokeAlign: BorderSide.strokeAlignOutside,
          // )
        ],
      ),
    );
  }
}
