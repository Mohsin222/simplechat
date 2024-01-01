import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldClass{


  static InputDecoration textFieldDecoration = InputDecoration(
    
  );


    static InputDecoration inputDecoration(BuildContext context,
      {required String hintText,
      String? labelText,
      Widget? suffixIcon,
      Icon? prefixIcon,
      double? padding}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        labelStyle: TextStyle(
            color: const Color(0xff7C7C7C),
            fontSize: 16.sp,
            fontWeight: FontWeight.w800),
        // label: Text(
        //   labelText ?? '',
        // ),
        filled: true,
        isDense: true,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 20, vertical: padding ?? 20),

        // filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
        focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
            errorBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        
        );
  }
}