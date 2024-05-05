import 'package:fatem_users/Core/widgets/clipped_shadow_button.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Features/Auth/presentation/Controller/Auth/auth_cubit.dart';
import 'package:fatem_users/Features/Auth/presentation/Controller/Auth/auth_states.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../Widgets/login_text_rows.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      builder: (context,state){
        final cubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
          body: Container(
            width: double.infinity,height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsData.loginBackground),
                    fit: BoxFit.fill)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SvgImage(imagePath: AssetsData.logo),
                RegularText(fontSizeAr: 38.sp,fontSizeEn: 38.sp, text: "FATEM", textColor: Colors.black, fontFamilyAr: ade, fontFamilyEn: ade,)
                ,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: RegularText(letterSpacing: -1,fontSizeAr: 13.sp,fontSizeEn: 13.sp, text: s.loginSlogan,textColor: Colors.black,fontFamilyAr: arLight,maxLine: 2,fontFamilyEn: enExtraLight,),
                ),

                SizedBox(height: 25.h,),



                ClippedShadowButton(
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3),  blurRadius: 4, offset: const Offset(0, 4))],
                  shadowHeight: 2.h,
                  height: 38.h,
                  width: 289.w,
                  shadowRadius: 16.w,
                  cutRadius: 12.w,
                  heightPercentage: 0.9,
                  shouldClip: true,

                  child: RegularButton(
                    height: 37.h,
                    width: 289.w,
                    borderRadius: 16.w,
                    buttonColor: buttonColor,
                    onTap: () {
                      cubit.signInWithGoogle().then((value) => {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeView()))
                      }) ;
                      if(currentPageIndex.isEmpty)
                      {
                        currentPageIndex.addFirst(3);
                      }
                    },
                    text: const GoogleButton(),
                  ),
                ),

                SizedBox(height: 15.h,),

                ClippedShadowButton(
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3),  blurRadius: 4, offset: const Offset(0, 4))],
                  shadowHeight: 2.h,
                  height: 38.h,
                  width: 289.w,
                  shadowRadius: 16.w,
                  cutRadius: 12.w,
                  heightPercentage: 0.9,
                  shouldClip: true,

                  child: RegularButton(
                    height: 37.h,
                    width: 289.w,
                    borderRadius: 16.w,
                    buttonColor: buttonColor,
                    onTap: (){},
                    text: const FacebookButton(),
                  ),
                ),
              ],
            ),

          ),
        );
      },
      listener: (context,state){},
    );
  }
}
