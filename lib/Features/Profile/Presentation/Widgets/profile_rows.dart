import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Core/widgets/image_svg.dart';
import 'package:fatem_users/Features/Auth/presentation/Controller/Auth/auth_cubit.dart';
import 'package:fatem_users/Features/Auth/presentation/Controller/Auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/utils/app_logger.dart';
import '../../../../Core/utils/assets_data.dart';
import '../../../../Core/widgets/texts.dart';
import '../../../../generated/l10n.dart';





class ProfileButton extends StatelessWidget{
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RegularText(
            fontSizeAr: 31.sp,
            text: s.profileText, fontSizeEn: 31.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}

class Account extends StatefulWidget{
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {


  @override
  void initState()
  {

    if(context.read<AuthCubit>().avatar == null || context.read<AuthCubit>().avatar == "")
    {
      context.read<AuthCubit>().avatar = cachedAvatar;
    }

    if(context.read<AuthCubit>().displayName == null || context.read<AuthCubit>().displayName == "")
    {
      context.read<AuthCubit>().displayName = name;
    }

    if(context.read<AuthCubit>().email == null || context.read<AuthCubit>().email == "")
    {
      context.read<AuthCubit>().email = email;
    }


    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<AuthCubit,AuthStates>(
      builder: (context, states){
        final cubit = BlocProvider.of<AuthCubit>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(width: 20.w),

            CircleAvatar(
              radius: 17.5.w,
              backgroundColor: Colors.transparent,
              child:  Padding(
                padding: EdgeInsets.all(1.5.w),
                child: ClipOval(
                  child: cubit.avatar == null || cubit.avatar == "" ?
                  const SvgImage(imagePath: AssetsData.profileIcon) : Image.network(cubit.avatar!, isAntiAlias: true, fit: BoxFit.cover,),
                ),
              ),
            ),

            SizedBox(width: 7.w),

            //Flexible for making the TextOverFlow works
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),

                  RegularText(
                      fontSizeAr: 14.sp,
                      text: cubit.displayName == null || cubit.displayName == "" ?
                      "*******" : cubit.displayName!
                      , fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular),
              
                  RegularText(
                      fontSizeAr: 9.sp,
                      text: cubit.email == null || cubit.email == "" ?
                      "*******" : cubit.email!
                      , fontSizeEn: 9.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enRegular)
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}



class PreviousOrders extends StatelessWidget{
  const PreviousOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.w,),
        SvgPicture.asset(AssetsData.previousOrders, width: 38.w,height: 38.h),
        SizedBox(width: 15.w,),
        RegularText(
            fontSizeAr: 16.sp,
            text: s.previousOrdersText, fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight)
      ],
    );
  }
}


class Languages extends StatelessWidget{
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.w,),
        SvgPicture.asset(AssetsData.language, width: 35.w,height: 35.h),
        SizedBox(width: 15.w,),
        RegularText(
            fontSizeAr: 16.sp,
            text: s.languagesText, fontSizeEn: 14.sp, textColor: Colors.black, fontFamilyAr: arRegular, fontFamilyEn: enLight),
        SizedBox(width: 65.w,),
        extraSizedBox(80.w),
        RegularText(
            fontSizeAr: 9.sp,
            text: s.currentLanguage, fontSizeEn: 9.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enExtraLight),
      ],
    );
  }


  Widget extraSizedBox(double width){
    return isArabic()? SizedBox(width: width) : const SizedBox();
  }
}


class LogOut extends StatelessWidget{
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RegularText(
            fontSizeAr: 17.sp,
            text: s.logOut, fontSizeEn: 17.sp, textColor: Colors.black, fontFamilyAr: arLight, fontFamilyEn: enLight),
      ],
    );
  }
}