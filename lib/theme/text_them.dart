import 'package:chatapp2/theme/text_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomTextTheme{

  CustomTextTheme._();
   static TextTheme lightTextTheme =TextTheme(
headlineLarge:const TextStyle().copyWith(fontSize: 32.sp, fontWeight: FontWeight.bold, color: ColorsClass.instagramBlack,),
headlineMedium:const TextStyle().copyWith(fontSize: 24.sp, fontWeight: FontWeight.w600, color: ColorsClass.instagramBlack,),
headlineSmall:const TextStyle().copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600, color: ColorsClass.instagramBlack,),



titleLarge:const TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorsClass.instagramBlack,),
titleMedium:const TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsClass.instagramBlack,),
titleSmall:const TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400, color: ColorsClass.instagramBlack,),


bodyLarge:const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorsClass.instagramBlack,),
bodyMedium: const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal, color:ColorsClass.instagramBlack,),
bodySmall: const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorsClass.instagramBlack.withOpacity(0.5),),



labelLarge: const TextStyle().copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: ColorsClass.instagramBlack),
labelMedium: const TextStyle().copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: ColorsClass.instagramBlack.withOpacity(0.5),),

  );



    static TextTheme darkTextTheme =TextTheme(
      headlineLarge:const TextStyle().copyWith(fontSize: 32.sp, fontWeight: FontWeight.bold, color: ColorsClass.instagramWhite,),
headlineMedium:const TextStyle().copyWith(fontSize: 24.sp, fontWeight: FontWeight.w600, color: ColorsClass.instagramWhite,),
headlineSmall:const TextStyle().copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600, color: ColorsClass.instagramWhite,),


titleLarge:const TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ColorsClass.instagramWhite,),
titleMedium:const TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsClass.instagramWhite,),
titleSmall:const TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400, color: ColorsClass.instagramWhite),


bodyLarge:const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorsClass.instagramWhite),
bodyMedium: const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal, color: ColorsClass.instagramWhite),
bodySmall: const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorsClass.instagramWhite.withOpacity(0.5),),



labelLarge: const TextStyle().copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color:ColorsClass.instagramWhite),
labelMedium: const TextStyle().copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: ColorsClass.instagramWhite.withOpacity(0.5),),
    );


}