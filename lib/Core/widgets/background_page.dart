import 'package:fatem_users/Core/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Features/About/presentation/views/about_view.dart';
import '../utils/assets_data.dart';
import 'image_svg.dart';



class BackgroundPage extends StatelessWidget
{
  const BackgroundPage({
    super.key,
    required this.bottomNavigationBar,
    required this.bodyWidget,
    this.topPosition,
    this.leftPosition,
    this.rightPosition,
  });


  final Widget bottomNavigationBar;
  final Widget bodyWidget;
  final double? topPosition;
  final double? leftPosition;
  final double? rightPosition;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: bottomNavigationBar,
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
              top: topPosition?? null,
              left: leftPosition?? null,

              child: const MyBackButton(),
            ),

            bodyWidget,
          ],
        ),
      ),
    );
  }
}