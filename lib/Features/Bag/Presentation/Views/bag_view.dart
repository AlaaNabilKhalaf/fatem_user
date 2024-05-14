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
      bottomNavigationBar: const BottomNavigationView(),
      topLeftWidget: const SizedBox(),
      topPosition: 39.h,
      leftPosition: 0.w,
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileGradButton(passedWidget: const Bag(), onTap: () {}),

          SizedBox(height: 25.h),

          BlurredClippedButton(
            passedWidget: const BagList() ,
            onTap: (){},
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
    );
  }
}
