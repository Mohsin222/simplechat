import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/views/auth/widget/auth_bottom_sheet.dart';
import 'package:chatapp2/views/auth/widget/login_widget.dart';
import 'package:chatapp2/views/auth/widget/signup_widget.dart';
import 'package:chatapp2/widget/custom_btn1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 14),
              padding: EdgeInsets.all(30),
        color: ColorsClass.backgroundColorDark,
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // padding: EdgeInsets.all(30),
              width: 273.4138488769531,
              height: 301.07440185546875,
              child: Image(image: AssetImage('assets/images/splashimg.png')),
            ),
            Text("Welcome",
                style: TextStyle(
                  fontSize: 36,
                  color: Color(0xffEF5858),
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffF4F4F4)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            CustomBtn(childText: "Create Account",
            baclgroundColor:  ColorsClass.backgroundColorLight,
             onPress: (){
               CustomMainBottomSheet.showSheet(context: context,height: 0.7.sh,child:SignUpWidget() );
            },),
  SizedBox(
              height: 15,
            ),
            CustomBtn(childText: "Login",baclgroundColor: ColorsClass.backgroundColorLight,
            onPress: (){
                           CustomMainBottomSheet.showSheet(context: context,height: 0.6.sh,child:LoginWidget() );
            },
            ),

    const    Spacer(),
            bottomText()
          ],
        ),
      ),
    );
  }

   bottomText(){
    return  const Text(
"All Right Reserved @2021",
style: TextStyle(
fontSize: 11,
fontWeight: FontWeight.w400,
color:Color(0xffffde69) 
)
);
  }
}


