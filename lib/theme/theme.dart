import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/theme/appbarTheme.dart';
import 'package:chatapp2/theme/textFeildTheme.dart';
import 'package:chatapp2/theme/text_them.dart';
import 'package:flutter/material.dart';

import 'bottomSheet.dart';
import 'elevatedButtonTheme.dart';

class CustomTheme{
  CustomTheme._();


  static ThemeData lightTheme =ThemeData(
     
    // cardColor: Colors.white70,
        // cardColor: Color(0xff454449),
        // cardColor: Color(0xff262626),

        primaryColor:ColorsClass.instagramWhite,
  accentColor:ColorsClass.instagramBlue,
  scaffoldBackgroundColor: ColorsClass.instagramWhite,
    useMaterial3: true,
    appBarTheme: CustomAppBarTheme.lightAppbarTheme,
  inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    //  scaffoldBackgroundColor: Colors.white,
    //  primaryColor: Color(0xFF405DE6),
          textTheme: CustomTextTheme.lightTextTheme,

          elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(88, 81, 219, 1)),
          bottomSheetTheme: CustomBottomSheet.lightBottomSheetTheme,

            iconTheme: IconThemeData(color: Colors.black)
  );


  
  static ThemeData darkTheme =ThemeData(
    // cardColor: Color(0xff454449),/

      brightness: Brightness.dark,
  primaryColor:ColorsClass.instagramBlack,
  accentColor: ColorsClass.instagramBlue,
  scaffoldBackgroundColor: ColorsClass.instagramBlack,
    useMaterial3: true,
    appBarTheme: CustomAppBarTheme.darkAppbarTheme,
      inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
            // scaffoldBackgroundColor: Color(0xFF292929),

            // primaryColor: Color(0xFF405DE6),

              textTheme: CustomTextTheme.darkTextTheme,
              
          // elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
                    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(88, 81, 219, 1)),

          bottomSheetTheme: CustomBottomSheet.darkBottomSheetTheme,
             iconTheme: IconThemeData(color: Colors.white)
  );
}