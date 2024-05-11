import 'dart:ui';
import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Features/Bag/Presentation/Views/bag_view.dart';
import 'package:fatem_users/Features/Favorites/Presentation/Views/favorites_view.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/BottomNavBar/bottom_nav_cubit.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/BottomNavBar/bottom_nav_state.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/home_view.dart';
import 'package:fatem_users/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/image_svg.dart';





class BottomNavigationView extends StatelessWidget
{
  const BottomNavigationView({super.key});

  final List<Widget?> _pages = const[ProfileView(), FavoritesView(), BagView(), HomeView()];
  //final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit,BottomNavStates>(
        builder: (context, state)
        {
          final cubit = BlocProvider.of<BottomNavCubit>(context);

          return ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(4.r),topLeft: Radius.circular(4.r)),
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 2,
                sigmaX: 2,
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.only(top: 2.h),//, right: 0.5.w,left: 0.5.w),
                height: 62.h,
                //width: double.infinity,
                decoration: BoxDecoration(
                    color: bottomNaviBarColor.withOpacity(0.4),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8.r),topLeft: Radius.circular(8.r)),
                    border: Border.all(
                      color : bottomNaviBarBorderColor.withOpacity(0.6),
                      width: 2.w,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    )
                ),
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    AssetsData.bottomNavIcons.length, (index) => _bottomNavBarItem(context,cubit, index),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context,state) => (){});
  }

  Widget _bottomNavBarItem(BuildContext context,BottomNavCubit cubit, index)
  {
    return GestureDetector(
      onTap: ()
      {
        if(index != cubit.currentIndex) {
          cubit.changeSelectedIndex(index);
          //pageController.animateToPage(index, duration: const Duration(microseconds: 10), curve: Curves.fastLinearToSlowEaseIn);
          Navigator.pushReplacement(context, MaterialPageRoute(
              settings: RouteSettings(
                  name: _pages[cubit.currentIndex]!.toString()),
              builder: (context) => _pages[cubit.currentIndex]!));
        }
      },
      child: SizedBox(
        height: bottomNavBarIconSize[index][1].h,
        width: bottomNavBarIconSize[index][0].w,
        child: SvgImage(imagePath: AssetsData.bottomNavIcons[index], color: cubit.currentIndex == index? Colors.red : null,),
      ),
    );
  }
}
