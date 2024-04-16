
import 'package:fatem_users/Core/constance.dart';
import 'package:flutter/material.dart';

import 'Core/widgets/texts.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RegularText(fontSizeAr: 22 ,fontSizeEn: 20, text: 'TEST',textColor: Colors.black,fontFamilyAr: ade,fontFamilyEn: ade,),
      ),
    );
  }
}
