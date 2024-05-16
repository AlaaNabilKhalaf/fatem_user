import 'package:fatem_users/Core/widgets/background_page.dart';
import 'package:fatem_users/Core/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../Home/Presentation/Views/bottom_navigation_view.dart';
import '../../data/models/categories_enum.dart';
import '../Widgets/category_widgets.dart';





class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.categoryName,
    required this.categoriesEnum,
  });

  final CategoriesEnum categoriesEnum;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        bottomNavigationBar: const BottomNavigationView(),
        bodyWidget: Column(
          children: [
            SizedBox(height: 131.h,),
            SizedBox(
              child: RegularText(
                  fontSizeAr: 35.sp,
                  textAlign: TextAlign.center,
                  text: categoryName, fontSizeEn: 28.sp, textColor: Colors.black, fontFamilyAr: arBold, fontFamilyEn: enRegular, letterSpacing: 9),
            ),
            SizedBox(height: 5.h,),
            CategoryGrid(categoriesEnum: categoriesEnum),
          ],
        )
    );
  }
}
