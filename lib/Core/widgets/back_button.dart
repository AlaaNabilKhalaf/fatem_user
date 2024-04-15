import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_outlined,
          color: Colors.black,
          size: 30,
        textDirection: TextDirection.ltr,
        ),
        onPressed: () {
          Navigator.pop(context);
        },),
    );
  }
}
