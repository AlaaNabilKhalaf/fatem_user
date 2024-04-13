
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/Texts.dart';
import '../../../../generated/l10n.dart';

class FacebookButton extends StatelessWidget {

  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AssetsData.facebookIcon),
        RegularText(text: s.facebookLogin,fontSize: 15,textColor: Colors.white,fontFamily: "LexendGiga",),
        // SizedBox(width: 10.h,),
      ],
    );
  }
}

class GoogleButton extends StatelessWidget {

  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AssetsData.googleIcon),
        RegularText(text: s.googleLogin,fontSize: 15,textColor: Colors.white,fontFamily: "LexendGiga",),
        // SizedBox(width: 5.h,),
      ],
    );
  }
}
