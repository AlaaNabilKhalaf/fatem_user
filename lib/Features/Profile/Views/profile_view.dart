import 'dart:ui';

import 'package:fatem_users/Core/widgets/back_button.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
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

    return Material(
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        elevation: 20.h,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        type: MaterialType.button,
        borderRadius: BorderRadius.circular(30.w),
        shadowColor: Colors.black54.withOpacity(0.5),

        child: GradButton(
          width: 290.w,
          height: 80.h,
          buttonColors: [
            gradColor[0].withOpacity(0.6),
            gradColor[1].withOpacity(0.4)
          ],
          borderRadius: 30.w,
          onTap: onTap,
          boxShadow: [],
          text: passedWidget,
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
                  child: SvgImage(
                    imagePath: AssetsData.logoEnglish,
                      width: 100.w,
                      height: 100.h)
              ),


              Positioned(
                  top: 45.h,
                  left: 0.w,
                  child: const MyBackButton(),
              ),



              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.w),
                    clipBehavior: Clip.antiAlias,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.w,
                        sigmaY: 2.h,
                      ),
                      child: ProfileGradButton(
                        passedWidget: const ProfileButton(),
                        onTap: () {
                          return null;
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 125.h,
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
                      print("Pressed");
                    },
                  ),

                  SizedBox(
                    height: 35.h,
                  ),

                  ProfileGradButton(
                      passedWidget: const Languages(),
                      onTap: (){
                        switch(Intl.getCurrentLocale())
                        {
                          case "en":
                            print("EN");
                            S.delegate.load(Locale("ar"));
                            break;
                          case "ar":
                            print("AR");
                            S.delegate.load(Locale("en"));
                            break;
                        }
                      }),

                  SizedBox(
                    height: 35.h,
                  ),

                  GestureDetector(
                    onTap: (){
                      print("SignedOut");
                      GoogleSignIn().disconnect();
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