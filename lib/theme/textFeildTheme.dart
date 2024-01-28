import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldTheme{
  CustomTextFieldTheme._();


 static InputDecorationTheme lightInputDecorationTheme =InputDecorationTheme(
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
  hintStyle: TextStyle(color: Colors.grey),
  
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            // borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          // fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        
      );


    static InputDecorationTheme darkInputDecorationTheme =InputDecorationTheme(   
      
  hintStyle: TextStyle(color: Colors.grey[400]),
      prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0.r),
            // borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0.r),
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.grey[800],
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        


    );
}