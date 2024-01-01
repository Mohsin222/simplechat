import 'package:chatapp2/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key, this.baclgroundColor, this.childText, this.onPress, this.loading,
  });
final Color? baclgroundColor;
final String? childText;
final VoidCallback? onPress;
final bool? loading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        // width: 281,
        width: double.infinity,
        height: 60.sp,
        decoration: BoxDecoration(
          border: Border.all(width: 2.w ,color:ColorsClass.backgroundColorDark ),
            borderRadius: BorderRadius.circular(15.r),
            color:baclgroundColor ==null? ColorsClass.backgroundColorDark :ColorsClass.backgroundColorLight ),
        alignment: Alignment.center,
        child:loading ==true ? CircularProgressIndicator(


        ) : Text(childText ?? '',
            style: TextStyle(
              color:baclgroundColor ==null ? ColorsClass.primaryColorLight :ColorsClass.primaryColorDark,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}