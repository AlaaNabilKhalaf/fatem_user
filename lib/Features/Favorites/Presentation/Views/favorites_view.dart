import 'package:fatem_users/Core/widgets/blurred_clipped_button.dart';
import 'package:fatem_users/Features/Favorites/Presentation/Widgets/favorites_widgets.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/bottom_navigation_view.dart';
import 'package:fatem_users/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/widgets/background_page.dart';



class FavoritesView extends StatelessWidget
{
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BackgroundPage(
      bottomNavigationBar: const BottomNavigationView(),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 123.h,),

          ProfileGradButton(
              passedWidget: const FavoriteCenter(),
              onTap: () {}
          ),

          SizedBox(height: 23.h),

          BlurredClippedButton(
            passedWidget: const FavoriteList(),
            key: key,
            onTap: (){
              //log(_key1.currentContext!.size!.height.toString());
            },
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
            //buttonHeight: _key1.currentContext!.size!.height.h >= 495.h? 495.h : _key1.currentContext!.size!.height.h,
            buttonHeight: 495.h,
            buttonWidth: 295.w,
            buttonRadius: 25.w,
            hasBorder: true,
            borderWidth: 1.w,
            borderStyle: BorderStyle.solid,
            borderColor: const Color(0xfffeefdf),
            borderStrokeAlign: BorderSide.strokeAlignInside,
          )
        ],
      ),
    );
  }
}