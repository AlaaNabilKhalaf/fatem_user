import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:fatem_users/Core/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/widgets/image_svg.dart';
import '../../../../generated/l10n.dart';
import '../widgets/back_button.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       decoration: const BoxDecoration(
         image: DecorationImage(
             fit: BoxFit.fill,
             image: AssetImage(
           AssetsData.aboutBackground
         ))
       ),
       height: double.infinity,
       width: double.infinity,
       child: Column(
         children: [
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 45.h,),
                const MyBackButton(),
                 SizedBox(height: 35.h,),
                 const Center(
                   child:
                   SvgImage(imagePath: AssetsData.logo),

                 ),
                 SizedBox(height: 29.h,),
                 Divider(
                   color: Colors.black,
                   indent: 69.w,endIndent: 69.w,
                   thickness: 2,
                 ),
                 SizedBox(height: 64.h,),

                 Padding(
                   padding: const EdgeInsets.all(18.0),
                   child: RegularText(
                     text: S.of(context).about,
                       fontSizeEn: 18.sp,fontSizeAr: 18.sp,
                       textColor: Colors.black,
                       fontFamilyAr: arLight,
                   maxLine: 6, fontFamilyEn: enExtraLight,),
                 )

               ],
             ),
           ),
           
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: RegularText(
               fontSizeAr: 11.sp,
               fontFamilyEn: enLight,
                 fontSizeEn: 11.sp,
                 text: "Copyright©2024-Fatem- All rights Reserved",
                 textColor: Colors.black,
                 fontFamilyAr: enLight),
           ),
           SizedBox(height: 20.h,)
         ],
       ),
     ),
    );
  }
}
