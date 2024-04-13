
import 'package:fatem_users/Features/About/presentation/views/about_view.dart';
import 'package:fatem_users/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/Texts.dart';
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
            Image.asset(AssetsData.name,
            ),
            const RegularText(fontSize: 38, text: "FATEM", textColor: Colors.black, fontFamily: "Ade")
            ,
            RegularText(fontSize: 13, text: s.loginSlogan,textColor: Colors.black,fontFamily: "LexendGiga",),

            SizedBox(height: 25.h,),

            RegularButton(
              height: 45.h,
              width: 290.w,
              borderRadius: 16.w,
              buttonColor: buttonColor,
              onTap: () async{
               await signInWithGoogle();
               Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutView()));
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
