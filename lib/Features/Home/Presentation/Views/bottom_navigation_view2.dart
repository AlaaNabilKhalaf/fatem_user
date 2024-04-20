import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/widgets/image_svg.dart';

class BottomNavigationView2 extends StatelessWidget {
  const BottomNavigationView2({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        backgroundColor: bottomNaviBarColor,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(icon:
          SvgImage(imagePath: AssetsData.profileIcon, width: 35.w,height:  35.h),
              label: "Profile",
          ),

          BottomNavigationBarItem(icon:
          SvgImage(imagePath: AssetsData.favoriteIcon, width: 27.w,height:  31.h),
            label: "Favorite",
          ),

          BottomNavigationBarItem(icon:
          SvgImage(imagePath: AssetsData.bagIcon, width: 31.w,height:  31.h),
              label: "Bag",
          ),

          BottomNavigationBarItem(
            icon: SvgImage(imagePath: AssetsData.homeIcon, width: 30.w,height:  30.h,),
            label: "Home",
          ),
        ],
    );
  }
}
