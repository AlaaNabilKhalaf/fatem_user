import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Core/widgets/texts.dart';
import 'package:fatem_users/Features/Auth/presentation/Views/login_view.dart';
import 'package:fatem_users/Features/Home/Presentation/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  goHome(){
    Future.delayed(const Duration(seconds: 2),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ){
        return token != null && token != "" ? const HomeView() : const LoginView();
      }));

    });
  }

  @override
  void initState() {
    super.initState();
    goHome();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
                image: AssetImage(AssetsData.splashBackground, )
            )
        ),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgImage(imagePath: AssetsData.logo),
            RegularText(fontSizeAr: 38.sp,fontSizeEn: 38.sp, text: "FATEM", textColor: Colors.black, fontFamilyAr: ade, fontFamilyEn: ade,)
          ],
        )),
      ),
    );
  }
}
