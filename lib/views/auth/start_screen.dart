import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/constants/text_file.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:chatapp2/views/auth/widget/auth_bottom_sheet.dart';
import 'package:chatapp2/views/auth/widget/login_widget.dart';
import 'package:chatapp2/views/auth/widget/signup_widget.dart';
import 'package:chatapp2/widget/custom_btn1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/imagesPath.dart';
import '../../constants/sizes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(30),
        height: 1.sh,
        width: 1.sw,
        constraints: BoxConstraints(
        //  maxHeight: 1.sh,
        // // width: double.infinity,
        // maxWidth: 1.sw,
 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  SizedBox(
              // padding: EdgeInsets.all(30),
              width: 273.4138488769531.w,
              height: 301.07440185546875.h,
              child: Image(image: AssetImage( ImagesClass.startScreenLogo )),
            ),
            SizedBox(height: SizesClass.defaultSpace,),
                  Text(ConstantTexts.startScreenHeading,
                style: TextStyle(
                  fontSize: 36.sp,
                  // color: Color(0xffEF5858),
            
                  fontWeight: FontWeight.w400,
                )
                
                ),
           SizedBox(height: SizesClass.spaceBtwItems,),
                  Text(
            ConstantTexts.startScreenText,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w300,
                  // color: Color(0xffF4F4F4)
                  ),
              textAlign: TextAlign.center,
              maxLines: 3,
              // overflow: TextOverflow.ellipsis,
            ),
             SizedBox(height: SizesClass.spaceBtwItems,),
            // ElevatedButton(onPressed: ()async{
            //   AuthServices authServices =AuthServices();
            //   await  authServices.getAllUser(userid: '',context: context);
            // }, child: Text('a')),
            CustomBtn(childText: "Create Account",
            baclgroundColor:  ColorsClass.backgroundColorLight,
              
             onPress: (){
               CustomMainBottomSheet.showSheet(context: context,height: 0.7.sh,child:SignUpWidget() );
            },),
           SizedBox(height: SizesClass.spaceBtwItems,),
            CustomBtn(childText: "Login",
            // baclgroundColor: ColorsClass.backgroundColorLight,
            onPress: (){
                          //  CustomMainBottomSheet.showSheet(context: context,height: 0.6.sh,child:LoginWidget() );
            LoginWidget.showSheet(context: context, height: 0.5.sh);
            
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


