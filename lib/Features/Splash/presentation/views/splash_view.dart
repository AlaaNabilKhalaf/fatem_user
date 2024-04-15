import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Core/widgets/texts.dart';
import 'package:fatem_users/Features/Profile/Views/profile_view.dart';
import 'package:fatem_users/test.dart';
import 'package:flutter/material.dart';
import '../../../../Core/constance.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../Auth/presentation/Views/login_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  goHome(){
    Future.delayed(const Duration(seconds: 2),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ){
        return token != null && token != "" ? const Test() : const LoginView();
      }));

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goHome();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ){
            return token != null && token != "" ? const Test() : const LoginView();
          }));
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                  image: AssetImage(AssetsData.splashBackground, )
              )
          ),
          child: const Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgImage(imagePath: AssetsData.logo),
              RegularText(fontSize: 38, text: "FATEM", textColor: Colors.black, fontFamilyAr: ade, fontFamilyEn: ade,)
            ],
          )),
        ),
      ),
    );
  }
}
