import 'dart:ui';
import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/app_logger.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';




class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context)
  {
    final s = S.of(context);

    return Align(
      child: Column(
        children:[
          RegularText(
            fontSizeAr: 27.sp,
            text: s.welcome,fontSizeEn: 22.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: ade, letterSpacing: 4,),
          SizedBox(height: 3.h),
          RegularText(
              fontSizeAr: 17.sp,
              text: name! == "" ? "PlaceHolder 👋" : "${name!} 👋",
              fontSizeEn: 17.sp, textColor: Colors.black,
              fontFamilyAr: enExtraLight, fontFamilyEn: enExtraLight,
              textDirection: TextDirection.ltr,),
        ]
      ),
    );
  }
}


class ListItems extends StatelessWidget
{
  const ListItems({super.key});

  //Items range will be 1-5 --> 0 and 6 are empty sized Boxes
  final itemsNumber = 7;

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: double.infinity,
      height: 180.h,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemsNumber,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.antiAlias,
          itemBuilder: (BuildContext context, int index)
          {
              if(index == 0 || index == itemsNumber - 1)
                {
                  return SizedBox(width: 105.w);
                }
              else
                {
                  return _buildCarousel(context, index);
                }
          },
         separatorBuilder: (BuildContext context, int index)
          {
              return SizedBox(width : 14.w);
          },
        ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
          height: 180.h,
          child: _buildCarouselItem(context, carouselIndex)
    );
  }


  Widget _buildCarouselItem(BuildContext context, int index) {
    final s = S.of(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5.h),

          GestureDetector(
            onTap: (){
              log(index.toString());
            },

            child: Container(
                  width: 127.w,
                  height: 127.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r))
                    ),
                    child: Image.asset(AssetsData.itemTemp, fit: BoxFit.fill),
                  ),
            ),

          RegularText(
              fontSizeAr: 22.sp,
              text: s.skin,fontSizeEn: 22.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enRegular, letterSpacing: 9,),
        ],
    );
  }

}

class BlurredRectangle extends StatelessWidget {
  const BlurredRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(colors: listGradColor,
              stops: const [0,0.5,1])
            ),
            child: SizedBox
              (
              width: double.infinity,
              height: 170.h,
            ),
          ),
        ),

        ClipRect(
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
            filter: ImageFilter.blur(
            sigmaY: 6,
            sigmaX: 6,
          ),
              child: const ListItems()
         )
        )
      ],
    );
  }
}



class CardsGrid extends StatelessWidget {
  const CardsGrid({super.key});

  //8 cards and 1 for empty space in bottom
  final itemsCount = 9;

  @override
  Widget build(BuildContext context) {
    return GridView.builder
        (
        clipBehavior: Clip.antiAlias,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: itemsCount,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          mainAxisExtent: 184.h,
        ),
        itemBuilder: (BuildContext context, int index)
        {
          if(index != itemsCount -1) {
            return  _ItemCard();
          }
          else
            {
              return SizedBox(height: 10.h,);
            }
        },
      );
  }
}


class _ItemCard extends StatefulWidget {

  @override
  State<_ItemCard> createState() => _ItemCardState();
}



class _ItemCardState extends State<_ItemCard> {

  SvgImage image = SvgImage(imagePath: AssetsData.emptyHeart, width: 18.w, height: 18.h,);
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

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
          child: Container(
            height: 114.h,
            width: 124.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                color: imageBGCardColor
            ),
            child: Padding(
                padding: EdgeInsets.all(4.65.r),
                child: Image.asset(AssetsData.itemTemp, fit: BoxFit.fill,)),
          ),
        ),

        Positioned(
            right: isArabic()? 16.w : null,
            left: isArabic()? null : 16.w,
            top: 125.h,
            child: RegularText(
              fontSizeAr: 13.sp,
              text: s.deodorant,fontSizeEn: 13.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
        ),

        Positioned(
            top: 141.h,
            right: isArabic()? 121.w : 16.w,
            left:  isArabic()? 16.w : 121.w,
            child: GestureDetector(
                onTap: (){
                  setState(()
                  {
                    if(liked) {
                      image = SvgImage(imagePath: AssetsData.heart, width: 18.w, height: 18.h,);
                      liked = false;
                    } else {
                      image = SvgImage(imagePath: AssetsData.emptyHeart, width: 18.w, height: 18.h,);
                      liked = true;
                    }
                  }
                  );
                },
                child: image
            )
        )
      ],
    );
  }
}


