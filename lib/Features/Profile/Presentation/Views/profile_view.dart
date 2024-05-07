import 'package:fatem_users/Core/widgets/blurred_clipped_button.dart';
import 'package:fatem_users/Core/widgets/back_button.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Features/About/presentation/views/about_view.dart';
import 'package:fatem_users/Features/Auth/presentation/Views/login_view.dart';
import 'package:fatem_users/Features/Profile/Controller/Cubits/Languages/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../Auth/presentation/Controller/AuthLocal/auth_cache_network.dart';
import '../../../Home/Presentation/Views/bottom_navigation_view.dart';
import '../../../PreviousOrders/Presentation/Views/previous_orders_view.dart';
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

    return BlurredClippedButton(
        passedWidget: passedWidget,
        onTap: onTap,
        shadow: shadow,
        shadowThickness: 3.h,
        shadowRadius: 25.w,
        cutRadius: 21.w,        //18
        shadowHeight: 64.h,     //68
        shadowWidth: 294.w,
        shadowHeightPercentage: 0.97,
        shouldClip: true,
        buttonColors: [
          gradColor[0].withOpacity(0.4),
          gradColor[1].withOpacity(0.4)
        ],
        buttonClipRadius: 25.w,
        sigmaX: 2,
        sigmaY: 2,
        buttonHeight: 62.h,
        buttonWidth: 295.w,
        buttonRadius: 25.w,
        hasBorder: true,
        borderColor: const Color(0xffDCCEB8),
        borderWidth: 1.w,
        borderStyle: BorderStyle.solid,
    );
  }
}





class ProfileView extends StatelessWidget
{
  const ProfileView({super.key});


  @override
  Widget build(BuildContext context) {

    final cubit = BlocProvider.of<LangCubit>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: const BottomNavigationView(),
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
                    top: 20.h,
                    right: 29.w,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutView()));
                      },
                      child: SvgImage(
                        imagePath: AssetsData.logoEnglish,
                          width: 61.w,
                          height: 90.h),
                    )
                ),


                Positioned(
                    top: 39.h,
                    left: 0.w,
                    child: const MyBackButton(),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ProfileGradButton(
                        passedWidget: const ProfileButton(),
                        onTap: (){}
                    ),

                    SizedBox(
                      height: 71.h,
                    ),

                    ProfileGradButton(
                        passedWidget: const Account(),
                        onTap: () {},
                    ),

                    SizedBox(
                      height: 17.h,
                    ),

                    ProfileGradButton(
                      passedWidget: const PreviousOrders(),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PreviousOrdersView()));
                      },
                    ),

                    SizedBox(
                      height: 17.h,
                    ),

                    ProfileGradButton(
                        passedWidget: const Languages(),
                        onTap: ()
                        {
                          cubit.changeLanguage();
                          CacheNetwork.deleteCacheItem(key: "lang");
                          CacheNetwork.insertStrings(key: "lang", value: cubit.currentLang??"");
                          cachedLang = CacheNetwork.getCacheData(key: "lang");
                        }),

                    SizedBox(
                      height: 26.h,
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
                      currentPageIndex.clear();
                     }
                      },
                      child: const LogOut(),
                    ),
                  ]
                ),
              ],
            ),
          ),
        ),
    );
  }
}