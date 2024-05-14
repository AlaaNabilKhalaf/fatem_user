import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/app_logger.dart';
import '../../../../Core/utils/product_model.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';
import '../../../Home/Presentation/Controller/Cubits/Products/products_cubit.dart';
import '../../../Home/Presentation/Controller/Cubits/Products/products_states.dart';





class Bag extends StatelessWidget{
  const Bag({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RegularText(
            fontSizeAr: 31.sp,
            text: s.bag, fontSizeEn: 31.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}


class BagList extends StatelessWidget {
  const BagList({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, states) {
        final cubit = BlocProvider.of<ProductsCubit>(context);
        if (cubit.bagList.isEmpty) {
          return const _BagEmpty();
        } else
        {
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, /*top: 15.h*/),
              child: SizedBox(
                width: 259.w,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: cubit.bagList.length,
                  itemExtent: 63.5.h,
                  clipBehavior: Clip.antiAlias,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index)
                  {
                    return Column(mainAxisSize: MainAxisSize.min, children: [
                      _BagListViewItem(productModel: cubit.bagList[index], index: index, cubit: cubit,),
                      index == cubit.bagList.length - 1
                          ? const SizedBox()
                          : Divider(
                        color: dividerColor,
                        thickness: 1.h,
                      ),
                    ]);
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}



class _BagListViewItem extends StatelessWidget
{
  const _BagListViewItem({
    //super.key,
    required this.cubit,
    required this.index,
    required this.productModel
  });

  final int index;
  final ProductModel productModel;
  final ProductsCubit cubit;

  @override
  Widget build(BuildContext context) {
    //final s = S.of(context);
    return Row(
      children:
      [
        Container(
          width: 46.w,
          height: 48.67.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            color: imageBGCardColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(1.r),
            child: Container(
              width: 44.w,
              height: 46.68.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  image: DecorationImage(image: AssetImage(productModel.image?? AssetsData.itemTemp), fit: BoxFit.fill)
              ),
            ),
          ),
        ),

        SizedBox(width: 12.w),

        SizedBox(
          width: 159.w,
          child: RegularText(
            fontSizeAr: 20.sp,
            textAlign: TextAlign.start,
            text: isArabic()? productModel.nameArabic! : productModel.nameEnglish!,fontSizeEn: 16.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enRegular, letterSpacing: 2,),
        ),

        const Spacer(),

        GestureDetector(
          onTap: ()
          {
            log("Clicked");
          },
          child: SizedBox(
            height: 22.h,
            width: 22.w,
            child: Image.asset(isArabic() ? AssetsData.bagArrowArabic : AssetsData.bagArrowEnglish, width: 22.w, height: 22.h,fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }
}






class _BagEmpty extends StatelessWidget
{
  const _BagEmpty();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 127.w,
            height: 145.h,
            child: Image.asset(AssetsData.emptyBag, fit: BoxFit.contain,)),
        SizedBox(height: 12.h),
        RegularText(
            fontSizeAr: 23.sp,
            text: s.noPreviousOrders,
            fontSizeEn: 15.sp,
            textColor: Colors.black,
            fontFamilyAr: arRegular,
            fontFamilyEn: enLight,
            maxLine: 3,
            textOverflow: TextOverflow.visible,
        )
      ],
    );
  }
}