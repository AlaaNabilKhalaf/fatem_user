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

  final itemsNumber = 5;

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      height: 171.h,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 114.w, right: 119.w),
          itemCount: itemsNumber,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemExtent: 127.w,
          itemBuilder: (BuildContext context, int index)
          {
              return Padding(
                  padding: EdgeInsets.only(left: 7.w, right: 7.w),
                  child: _listViewItem(context, index));
          },
        ),
    );
  }

  Widget _listViewItem(BuildContext context, int index) {
    final s = S.of(context);
    return Column(
        children: <Widget>
        [
          GestureDetector(
            onTap: (){
              log(index.toString());
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
        // Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(colors: listGradColor,
        //           stops: const [0,0.5,1])
        //   ),
        //   child: SizedBox
        //     (
        //     width: double.infinity,
        //     height: 171.h,
        //   ),
        // ),

        // ClipRect(
        //     clipBehavior: Clip.antiAlias,
        //     child: BackdropFilter(
        //     filter: ImageFilter.blur(
        //     sigmaY: 6,
        //     sigmaX: 6,
        //   ),
        //       child: const ListItems()
        //  )
        // ),
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

  final itemsCount = 8;

  @override
  Widget build(BuildContext context) {
    return GridView.builder
        (
        clipBehavior: Clip.antiAlias,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 65.h),
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
          return _ItemCard();
        },
      );
  }
}


class _ItemCard extends StatefulWidget {

  @override
  State<_ItemCard> createState() => _ItemCardState();
}


class _ItemCardState extends State<_ItemCard> {

  SvgImage? image;
  SvgImage emptyHeart = SvgImage(imagePath: AssetsData.emptyHeart, width: 18.w, height: 18.h,);
  SvgImage filledHeart = SvgImage(imagePath: AssetsData.heart, width: 18.w, height: 18.h,);
  bool liked = false;

  @override
  void initState() {
    super.initState();
    image = emptyHeart;
  }

  
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
                onTap: ()
                {
                  setState(() {
                    switch(liked)
                    {
                      case true:
                        image = emptyHeart;
                        liked = false;
                        break;
                      case false:
                        image = filledHeart;
                        liked = true;
                        break;
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


