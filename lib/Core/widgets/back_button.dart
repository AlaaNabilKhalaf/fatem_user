import 'package:fatem_users/Core/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: IconButton(
        icon: Icon(Icons.arrow_back_outlined,
          color: Colors.black,
          size: 26.h,
        textDirection: TextDirection.ltr,
        ),
        onPressed: () {
          Navigator.pop(context);
          //log(ModalRoute.of(context)!.settings.name.toString());
          if(currentPageIndex.isNotEmpty && ModalRoute.of(context)?.settings.name != "AboutView")
          {
            currentPageIndex.removeFirst();
          }
        },),
    );
  }
}
