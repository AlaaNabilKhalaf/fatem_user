import 'package:fatem_users/Core/widgets/Texts.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../Auth/presentation/Views/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  goHome(){
    Future.delayed(const Duration(seconds: 2),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ){
        return const LoginView();
      }));

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //intiSlidingAnimation();
    goHome();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ){
            return const LoginView();
          }));
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                  image: AssetImage(AssetsData.splashBackground, )
              )
          ),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsData.name),
              const RegularText(fontSize: 38, text: "FATEM", textColor: Colors.black, fontFamily: "Ade")
            ],
          )),
        ),
      ),
    );
  }
}