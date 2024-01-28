import 'package:flutter/material.dart';

class CustomElevatedButtonTheme{
  CustomElevatedButtonTheme._();



    static final  ElevatedButtonThemeData lightElevatedButtonTheme= ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            primary: Color(0xFF405DE6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),)
    );


      static final  ElevatedButtonThemeData darkElevatedButtonTheme= ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            backgroundColor : Color(0xFF405DE6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              
            ),
          ),
      );
}