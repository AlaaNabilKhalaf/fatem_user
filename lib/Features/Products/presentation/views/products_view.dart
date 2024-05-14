import 'package:fatem_users/Core/widgets/texts.dart';
import 'package:fatem_users/Features/Categories/data/models/categories_enum.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Products/products_cubit.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Products/products_states.dart';
import 'package:fatem_users/Features/Products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constance.dart';
import '../../../../Core/utils/app_logger.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/back_button.dart';
import '../../../../Core/widgets/image_svg.dart';
import '../../../About/presentation/views/about_view.dart';

class ProductsView extends StatefulWidget {
  final CategoriesEnum categoriesEnum;
  const ProductsView({super.key, required this.categoriesEnum});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late List<ProductModel> products = [];
  // @override
  // void initState() {

  //   log('products ${products.length}');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    products = allProduct
        .where((element) => element.category == widget.categoriesEnum)
        .toList();
    setState(() {});
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsData.loginBackground),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
                top: 20.h,
                right: 29.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            settings: const RouteSettings(name: "AboutView"),
                            builder: (context) => const AboutView()));
                  },
                  child: SvgImage(
                      imagePath: AssetsData.logoEnglish,
                      width: 61.w,
                      height: 90.h),
                )),
            Positioned(
              top: 39.h,
              left: 0.w,
              child: const MyBackButton(),
            ),
            GridView.builder(
              padding: EdgeInsets.only(top: 150),
              itemBuilder: (context, index) {
                return BlocBuilder<ProductsCubit, ProductsStates>(
                    builder: (context, cubit) {
                  return Stack(
                    children: [
                      Container(
                        // height: 184.h,
                        // width: 156.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            color: itemCardColor.withOpacity(0.3)),
                      ),

                      //158.h
                      Positioned(
                        top: 8.h,
                        left: 16.w,
                        right: 16.w,
                        bottom: 62.h,
                        child: Container(
                          height: 114.h,
                          width: 124.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              color: imageBGCardColor),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.65.h, horizontal: 4.w),
                              child: Container(
                                width: 116.w,
                                height: 104.69.h,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.r)),
                                    image: const DecorationImage(
                                      image: AssetImage(AssetsData.itemTemp),
                                      fit: BoxFit.contain,
                                    )),
                              )),
                        ),
                      ),

                      Positioned(
                        right: isArabic() ? 16.w : null,
                        left: isArabic() ? null : 16.w,
                        top: 125.h,
                        width: 124.w,
                        child: RegularText(
                            textAlign: TextAlign.start,
                            fontSizeAr: 13.sp,
                            text: products[index].nameEnglish ?? '',
                            fontSizeEn: 13.sp,
                            textColor: Colors.black,
                            fontFamilyAr: arRegular,
                            fontFamilyEn: enRegular),
                      ),

                      Positioned(
                          top: 141.h,
                          right: isArabic() ? 121.w : 16.w,
                          left: isArabic() ? 16.w : 121.w,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<ProductsCubit>()
                                  .favoriteAddOrRemove(products[index], index);
                            },
                            child: context
                                    .read<ProductsCubit>()
                                    .favoritesIndex
                                    .contains(index)
                                ? SvgImage(
                                    imagePath: AssetsData.heart,
                                    width: 17.w,
                                    height: 17.h,
                                  )
                                : SvgImage(
                                    imagePath: AssetsData.emptyHeart,
                                    width: 17.w,
                                    height: 17.h,
                                  ),
                          ))
                    ],
                  );
                });
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
              ),
              itemCount: products.length,
            ),
          ],
        ),
      ),
    );
  }
}
