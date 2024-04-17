import 'dart:math';
import 'dart:ui';
import 'package:fatem_users/Core/widgets/ClippedShadowButton.dart';
import 'package:fatem_users/Core/widgets/back_button.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Features/About/presentation/views/about_view.dart';
import 'package:fatem_users/Features/Auth/presentation/Views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/custom_grad_button.dart';
import '../../../../generated/l10n.dart';
import 'package:intl/intl.dart';
import '../../Auth/presentation/Controller/AuthLocal/auth_cache_network.dart';
import '../Widgets/profile_rows.dart';



class ProfileGradButton extends StatelessWidget {
  final Widget passedWidget;
  final Function onTap;

  const ProfileGradButton({
    super.key,
    required this.passedWidget,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {

    return ClippedShadowButton(
        boxShadow: shadow,
        shadowHeight: 3.h,
        height: 68.h,
        width: 294.w,
        shadowRadius: 25.w,
        cutRadius: 18.w,
        heightPercentage: 0.97,
        shouldClip: true,

        child: GradButton(
          width: 295.w,
          height: 62.h,
          buttonColors: [
            gradColor[0].withOpacity(0.4),
            gradColor[1].withOpacity(0.4)
          ],
          borderRadius: 25.w,
          onTap: onTap,
          text: passedWidget,
          border: Border.all(
              color : const Color(0xffDCCEB8),
              width: 1.w,
              style: BorderStyle.solid
          ),
        )
    );
  }
}





class ProfileView extends StatelessWidget
{
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);


    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsData.loginBackground),
          fit: BoxFit.fill)
        ),
          child :
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                  top: 15.h,
                  right: 2.w,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutView()));
                    },
                    child: SvgImage(
                      imagePath: AssetsData.logoEnglish,
                        width: 100.w,
                        height: 100.h),
                  )
              ),


              Positioned(
                  top: 45.h,
                  left: 0.w,
                  child: const MyBackButton(),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  ClippedShadowButton(
                    boxShadow: shadow,
                    shadowHeight: 3.h,
                    height: 68.h,
                    width: 294.w,
                    shadowRadius: 25.w,
                    cutRadius: 18.w,
                    heightPercentage: 0.97,
                    shouldClip: true,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.w),
                      clipBehavior: Clip.antiAlias,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2,
                          sigmaY: 2,
                        ),
                        child: GradButton(
                              width: 295.w,
                              height: 62.h,
                              buttonColors: [
                                gradColor[0].withOpacity(0.4),
                                gradColor[1].withOpacity(0.4)
                              ],
                              borderRadius: 25.w,
                              onTap: (){},
                              text: const ProfileButton(),
                              border: Border.all(
                                  color : const Color(0xffDCCEB8),
                                  width: 1.w,
                                  style: BorderStyle.solid
                              ),
                            )
                        )
                      ),
                  ),


                  SizedBox(
                    height: 71.h,
                  ),

                  ProfileGradButton(
                      passedWidget: const Account(),
                      onTap: () {
                        return null;
                        },
                  ),


                  SizedBox(
                    height: 35.h,
                  ),


                  ProfileGradButton(
                    passedWidget: const PreviousOrders(),
                    onTap: () {
                      print(avatar);
                    },
                  ),

                  SizedBox(
                    height: 35.h,
                  ),

                  ProfileGradButton(
                      passedWidget: const Languages(),
                      onTap: () async {
                        switch(Intl.getCurrentLocale())
                        {
                          case "en":
                            S.delegate.load(const Locale("ar"));
                            await WidgetsBinding.instance.performReassemble();
                            break;
                          case "ar":
                            S.delegate.load(const Locale("en"));
                            await WidgetsBinding.instance.performReassemble();
                            break;
                        }
                      }),

                  SizedBox(
                    height: 25.h,
                  ),

                  GestureDetector(
                    onTap: (){


                   {   GoogleSignIn google = GoogleSignIn();
                   google.disconnect().then((value) => {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginView()))
                   });

                   CacheNetwork.deleteCacheItem( key: 'token');
                   CacheNetwork.deleteCacheItem( key: 'name');
                   CacheNetwork.deleteCacheItem( key: 'email');
                   CacheNetwork.deleteCacheItem( key: 'avatarPath');
                   CacheNetwork.deleteCacheItem( key: 'phoneNumber');

                   }
                    },
                    child: const LogOut(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}