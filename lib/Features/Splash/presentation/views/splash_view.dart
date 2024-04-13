
import 'package:flutter/material.dart';

import '../../../../Core/utils/assets_data.dart';
import '../../../Auth/presentation/Views/login_view.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{
  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation ;

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
    intiSlidingAnimation();
    goHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  void intiSlidingAnimation(){
    animationController = AnimationController(vsync: this , duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: const Offset(0 , 1) , end: Offset.zero ).animate(animationController);
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ){
          //   return const LoginView();
          // }));
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                  image: AssetImage(AssetsData.splashBackground, )
              )
          ),
          child: AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context , _ ){
              return SlideTransition(
                position:  slidingAnimation,
                child: Center(child: Image.asset(AssetsData.logo)),
              );
            },
          ),
        ),
      ),
    );
  }
}
