import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Products/products_cubit.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Products/products_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/app_logger.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';
import '../../../Products/data/models/product_model.dart';






class ItemDescription extends StatelessWidget {

  final ProductModel productModel;

  const ItemDescription({
    super.key,
    required this.productModel
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        Container(width: 21.w),
        Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 19.h,),
            Container(
              height: 127.h,
              width: 127.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  border: Border.all(color: imageBGCardColor),
                  image:  DecorationImage(image: AssetImage(productModel.img?? AssetsData.itemTemp), fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 6.h,),
            SizedBox(
              width: 125.w,
              child: RegularText(
                  fontSizeAr: 18.sp,
                  textAlign: TextAlign.start,
                  text: isArabic()? productModel.nameArabic! : productModel.nameEnglish!, fontSizeEn: 13.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
            ),
            // SizedBox(
            //   width: 125.w,
            //   child: RegularText(
            //       fontSizeAr: 10.sp,
            //       textAlign: TextAlign.start,
            //       text: isArabic()? productModel.ingredientsArabic??"فاااضي" : productModel.ingredientsEnglish??"Empty", fontSizeEn: 6.5.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular, maxLine: 6,),
            // )
          ],
        ),
        SizedBox(width: 21.w,),
        Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26.h),
            Container(
              width: 120.w,
              padding: EdgeInsets.only(right: 24.w),
              child: RegularText(
                  fontSizeAr: 18.sp,
                  textAlign: TextAlign.start,
                  maxLine: 8,
                  text: s.benefits, fontSizeEn: 13.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
            ),
            Container(
              height: 60.h,
              width: 120.w,
              padding: EdgeInsets.only(right: 19.w),
              child: RegularText(
                  fontSizeAr: 11.sp,
                  textAlign: TextAlign.start,
                  maxLine: 8,
                  text: s.tipsForUse, fontSizeEn: 9.7.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
            ),
          ],
        )
      ],
    );
  }
}




class AddToBag extends StatelessWidget
{
  final ProductModel productModel;
  const AddToBag({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<ProductsCubit,ProductsStates>(
        builder: (context,states)
        {
          final cubit = BlocProvider.of<ProductsCubit>(context);
          return GestureDetector(
            onTap: (){
              cubit.bagAddOrRemove(productModel);
            },
            child: Container(
              alignment: Alignment.center,
              width: 167.w,
              height: 36.h,
              clipBehavior: Clip.antiAlias,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: addToBagColor,
                  boxShadow: shadow
              ),
              child: RegularText(
                  fontSizeAr: 18.sp,
                  textAlign: TextAlign.center,
                  text: s.addToBag, fontSizeEn: 12.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
            ),
          );
        }
    );
  }
}

