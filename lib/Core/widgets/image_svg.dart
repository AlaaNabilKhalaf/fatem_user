import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({
    super.key,
  required this.imagePath,
    this.width,
    this.height

  });

  final String imagePath ;
  final double? height ;
  final double? width ;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
    );
  }
}
