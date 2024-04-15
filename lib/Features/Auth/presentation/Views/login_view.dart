import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Features/About/presentation/views/about_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../Controller/Auth/google_auth.dart';
import '../Widgets/login_text_rows.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

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
            RegularText(fontSize: 38.sp, text: "FATEM", textColor: Colors.black, fontFamilyAr: ade, fontFamilyEn: ade,)
            ,
            RegularText(fontSize: 14.sp, text: s.loginSlogan,textColor: Colors.black,fontFamilyAr: arLight,maxLine: 2,fontFamilyEn: enExtraLight,),

            SizedBox(height: 25.h,),

            RegularButton(
              height: 45.h,
              width: 290.w,
              borderRadius: 16.w,
              buttonColor: buttonColor,
              onTap: () {
                signInWithGoogle().then((value) => {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AboutView()))
                }) ;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
    // color: Colors.redAccent,
    // alignment: Alignment.center,
    // height: 25.h,
    // child: const Text("Something went wrong try again later"),
    // ))) ;
              },
              text: const GoogleButton(),
            ),

            SizedBox(height: 15.h,),

            RegularButton(
              height: 42.h,
              width: 290.w,
              borderRadius: 16.w,
              buttonColor: buttonColor,
              onTap: (){},
              text: const FacebookButton(),
            ),
          ],
        ),

      ),
    );
  }
}
