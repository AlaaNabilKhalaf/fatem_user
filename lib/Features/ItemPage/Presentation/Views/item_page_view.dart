import 'package:fatem_users/Core/widgets/background_page.dart';
import 'package:fatem_users/Core/widgets/blurred_clipped_button.dart';
import 'package:fatem_users/Core/widgets/texts.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/bottom_navigation_view.dart';
import 'package:fatem_users/Features/ItemPage/Presentation/Widgets/item_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/app_logger.dart';
import '../../../../Core/utils/product_model.dart';








class ItemPageView extends StatelessWidget {

  final ProductModel? productModel;

  const ItemPageView({
    super.key,
    this.productModel
  });

  @override
  Widget build(BuildContext context) {
    return  BackgroundPage(
        bottomNavigationBar: const BottomNavigationView(),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 142.h,),
            Row(
              children: [
                SizedBox(width: 42.w,),
                SizedBox(
                  width: 295.w,
                  child: RegularText(
                      fontSizeAr: 31.sp,
                      textAlign: TextAlign.start,
                      text: isArabic()? productModel!.nameArabic! : productModel!.nameEnglish!, fontSizeEn: 25.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 32.w,),
                BlurredClippedButton(
                  passedWidget: ItemDescription(productModel: productModel!),
                  withShadow: true,
                  shadow: shadow,
                  shadowRadius: 25.w,
                  cutRadius: 22.w,
                  shadowHeight: 240.h,
                  shadowWidth: 295.w,
                  shadowHeightPercentage: 0.978,
                  shouldClip: true,
                  onTap: (){},
                  buttonColors: [
                    gradColor[0].withOpacity(0.4),
                    gradColor[1].withOpacity(0.4)
                  ],
                  buttonClipRadius: 25.r,
                  sigmaX: 4,
                  sigmaY: 4,
                  buttonHeight: 234.h,
                  buttonWidth: 295.w,
                  buttonRadius: 25.r,
                  hasBorder: true,
                  borderWidth: 1.w,
                  borderStyle: BorderStyle.solid,
                  borderColor: itemViewBorderColor,
                  borderStrokeAlign: BorderSide.strokeAlignInside,
                ),
              ],
            ),
            SizedBox(height: 21.h),
            Row(
              children: [
                SizedBox(width: 96.w,),
                AddToBag(productModel: productModel!),
              ],
            )
          ],
        )
    );
  }
}
