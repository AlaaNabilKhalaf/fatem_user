import 'dart:ui';
import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Features/Bag/Presentation/Views/bag_view.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/home_view.dart';
import 'package:fatem_users/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/image_svg.dart';



class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {


  List<Widget?> pages = [const ProfileView(), null, const BagView(), const HomeView()];

  void navigateToPage(int index)
  {
    if(index == 3)
      {
        currentPageIndex.clear();
        currentPageIndex.addFirst(3);
      }
    Navigator.push(context, MaterialPageRoute(settings: RouteSettings(name: pages[index]!.toString()),builder: (context)=> pages[index]!));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8.w),topLeft: Radius.circular(8.w)),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 2,
          sigmaX: 2,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 1.5.h, right: 1.w,left: 1.w),
          height: 62.h,
          width: 360.w,
          decoration: BoxDecoration(
            color: bottomNaviBarColor.withOpacity(0.4),
            borderRadius: BorderRadius.only(topRight: Radius.circular(8.w),topLeft: Radius.circular(8.w)),
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
                AssetsData.bottomNavIcons.length, (index) => GestureDetector(
                  onTap: ()
                  {
                    if(currentPageIndex.isEmpty || currentPageIndex.first != index)
                    {
                      //printing the current page name (same as Class name)
                      //print(ModalRoute.of(context)?.settings.name);
                      setState(() {
                        pageIndex = index;
                        currentPageIndex.addFirst(index);
                        navigateToPage(index);
                        }
                      );
                    }
                  },
                  child: SizedBox(
                    height: bottomNavBarIconSize[index][1].h,
                    width: bottomNavBarIconSize[index][0].w,
                    child: SvgImage(imagePath: AssetsData.bottomNavIcons[index]),
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}
