import 'package:fatem_users/Core/utils/assets_data.dart';
import 'package:flutter/material.dart';

import '../../../../Core/widgets/image_svg.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon:
          SvgImage(imagePath: AssetsData.homeIcon),

          ),
          BottomNavigationBarItem(icon:
          SvgImage(imagePath: AssetsData.favoriteIcon),

          ),
          BottomNavigationBarItem(icon:
          SvgImage(imagePath: AssetsData.bagIcon),

          ),
          BottomNavigationBarItem(icon:
          SvgImage(imagePath: AssetsData.profileIcon),

          ),


        ],
      ),
    );
  }
}
