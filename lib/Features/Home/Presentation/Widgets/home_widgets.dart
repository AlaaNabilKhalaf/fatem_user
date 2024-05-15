import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:fatem_users/Core/utils/product_model.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Features/Auth/presentation/Controller/Auth/auth_cubit.dart';
import 'package:fatem_users/Features/Auth/presentation/Controller/Auth/auth_states.dart';
import 'package:fatem_users/Features/Category/Data/category_enum.dart';
import 'package:fatem_users/Features/Category/Presentation/Views/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/app_logger.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';
import '../../../ItemPage/Presentation/Views/item_page_view.dart';
import '../Controller/Cubits/Products/products_cubit.dart';
import '../Controller/Cubits/Products/products_states.dart';



class WelcomeMessage extends StatefulWidget {
  const WelcomeMessage({super.key});

  @override
  State<WelcomeMessage> createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {

  @override
  void initState() {
    if(context.read<AuthCubit>().displayName == null || context.read<AuthCubit>().displayName == "")
    {
      context.read<AuthCubit>().displayName = name;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<AuthCubit,AuthStates>(
      builder: (context,states){
        final cubit = BlocProvider.of<AuthCubit>(context);
        final s = S.of(context);
        return Align(
          child: Column(
              children:[
                RegularText(
                  fontSizeAr: 27.sp,
                  text: s.welcome,fontSizeEn: 22.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: ade, letterSpacing: 4,),
                SizedBox(height: 3.h),

                SizedBox(
                  child: RegularText(
                    fontSizeAr: 17.sp,
                    text: cubit.displayName == "" || cubit.displayName == null?
                    "${s.there} 👋" : "${cubit.displayName} 👋",
                    fontSizeEn: 17.sp, textColor: Colors.black,
                    fontFamilyAr: enExtraLight, fontFamilyEn: enExtraLight,
                    textDirection: TextDirection.ltr,),
                ),
              ]
          ),
        );
      },
    );
  }
}


class ListItems extends StatelessWidget
{
  const ListItems({super.key});

  @override
  Widget build(BuildContext context)
  {

    return SizedBox(
      height: 171.h,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 114.w, right: 119.w),
          itemCount: CategoriesEnum.values.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemExtent: 127.w,
          itemBuilder: (BuildContext context, int index)
          {
              return ListViewItem(index: index);
          },
        ),
    );
  }

}


class ListViewItem extends StatelessWidget
{
  const ListViewItem({
    super.key,
    required this.index
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<String> label = [s.face,s.body,s.hair,s.skin];

    return Padding(
      padding: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Column(
        children: <Widget>
        [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  CategoryView(categoryName: label[index],
                    categoriesEnum: CategoriesEnum.values[index])
              ));
            },
            child: Container(
              height: 127.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.r),),
                  image: const DecorationImage(image: AssetImage(AssetsData.itemTemp), fit: BoxFit.fitHeight, isAntiAlias: true)
              ),
            ),
          ),

          RegularText(
            fontSizeAr: 27.sp,
            text: label[index],
            fontSizeEn: 22.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enRegular, letterSpacing: 9,),
        ],
      ),
    );
  }
}




class BlurredRectangle extends StatelessWidget {
  const BlurredRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ListItems(),

        IgnorePointer(
          ignoring: true,
          child: Container(
            width: double.infinity,
            height: 171.h,
            decoration: BoxDecoration(
                //boxShadow: [BoxShadow(color: const Color(0xffD1A582).withOpacity(0.4), offset: Offset(0, 0)), BoxShadow(color: Colors.blue, offset: Offset(50, 0))],
                gradient: LinearGradient(colors: listGradColor,
                    stops: const [0,0.5,1]),
              ),
            ),
          ),
      ],
    );
  }
}


class CardsGrid extends StatelessWidget {
  const CardsGrid({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<ProductsCubit,ProductsStates>(
        builder: (context, state)
        {
          final cubit = BlocProvider.of<ProductsCubit>(context);
          return Expanded(
            child: GridView.builder(
              clipBehavior: Clip.antiAlias,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 65.h),
              itemCount: tempProduct?.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                mainAxisExtent: 184.h,
              ),
              itemBuilder: (BuildContext context, int index)
              {
                return ItemCard(productModel: tempProduct![index], cubit: cubit, index: index);
              },
            ),
          );
        }
    );
  }
}


class ItemCard extends StatelessWidget
{

  const ItemCard({super.key,
    required this.productModel,
    required this.cubit,
    required this.index,
  });

  final ProductModel productModel;
  final ProductsCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children: [
        Container(
          height: 184.h,
          width: 156.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: itemCardColor.withOpacity(0.3)
          ),
        ),

        //158.h
        Positioned(
          top: 8.h,
          left: 16.w,
          right: 16.w,
          bottom: 62.h,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ItemPageView(productModel: productModel)));
            },
            child: Container(
              height: 114.h,
              width: 124.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  color: imageBGCardColor
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.65.h, horizontal: 4.w),
                  child: Container(
                        width: 116.w,
                        height: 104.69.h,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.r)),
                        image: DecorationImage(image: AssetImage(productModel.image?? AssetsData.itemTemp), fit: BoxFit.fill,
                        )
                    ),
                  )
              ),
            ),
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
              text: isArabic()? productModel.nameArabic! : productModel.nameEnglish!/*s.deodorant*/,
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
                onTap: ()
                {
                  cubit.favoriteAddOrRemove(productModel, index);
                },
                child: cubit.favoritesIndex.contains(index)?
                SvgImage(imagePath: AssetsData.heart, width: 17.w, height: 17.h,) : SvgImage(imagePath: AssetsData.emptyHeart, width: 17.w, height: 17.h,),
            )
        )
      ],
    );
  }
}