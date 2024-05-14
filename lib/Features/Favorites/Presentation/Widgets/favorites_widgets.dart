import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Favorites/favorites_cubit.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Favorites/favorites_states.dart';
import 'package:fatem_users/Features/Products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';





class FavoriteCenter extends StatelessWidget{
  const FavoriteCenter({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RegularText(
            fontSizeAr: 31.sp,
            text: s.favorite, fontSizeEn: 31.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}



class EmptyFavoritesPage extends StatelessWidget
{
  const EmptyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 162.w,
            height: 145.h,
            child: Image.asset(AssetsData.favorite, fit: BoxFit.contain,)),
        SizedBox(height: 11.h),
        RegularText(
            textOverflow: TextOverflow.visible,
            fontSizeAr: 21.sp,
            text: s.emptyFavoritePage,
            fontSizeEn: 21.sp,
            textColor: Colors.black,
            fontFamilyAr: arRegular,
            fontFamilyEn: enRegular,
            maxLine: 3,
        )
      ],
    );
  }
}


class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  final int itemsCount = 4;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesStates>(
      builder: (context, states) {
        final cubit = BlocProvider.of<FavoritesCubit>(context);

        if (cubit.favoritesList.isEmpty) {
          return const EmptyFavoritesPage();
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
                  itemCount: cubit.favoritesList.length,
                  itemExtent: 63.5.h,
                  clipBehavior: Clip.antiAlias,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    //return FavoritesListViewItem(index: index);
                    return Column(mainAxisSize: MainAxisSize.min, children: [
                      FavoritesListViewItem(productModel: cubit.favoritesList[index], index: index, cubit: cubit,),
                      index == cubit.favoritesList.length - 1
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

class FavoritesListViewItem extends StatelessWidget
{
  const FavoritesListViewItem({
    super.key,
    required this.cubit,
    required this.index,
    required this.productModel
  });

  final int index;
  final ProductModel productModel;
  final FavoritesCubit cubit;

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
                  image: const DecorationImage(image: AssetImage(AssetsData.itemTemp), fit: BoxFit.fill)
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
            text: productModel.title,fontSizeEn: 16.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enRegular, letterSpacing: 2,),
        ),

        const Spacer(),

        GestureDetector(
          onTap: ()
          {
            cubit.favoriteRemoved(productModel);
          },
          child: SizedBox(
              height: 17.h,
              width: 17.w,
            child: SvgImage(imagePath: AssetsData.heart, width: 17.w, height: 17.h,),
          ),
        ),
      ],
    );
  }
}