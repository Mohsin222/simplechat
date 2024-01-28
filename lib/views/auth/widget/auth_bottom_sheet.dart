import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/utils/text_field_decoration.dart';
import 'package:chatapp2/views/auth/widget/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/custom_btn1.dart';

class CustomMainBottomSheet extends StatelessWidget {
   CustomMainBottomSheet({super.key, required this.child, this.height});
final Widget child;
final double? height;


 static  showSheet({required BuildContext context, required Widget child, double? height}){
    return    showModalBottomSheet(
      
                    context: context,
                    //  isScrollControlled: true,
       
                    // clipBehavior:Clip.hardEdge ,
                     
  isDismissible: false,
  isScrollControlled: false,
                         shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                    builder: (context) {
 

return CustomMainBottomSheet(child: child,height: height,);
                    });
  }

  // ScrollController scrollController =ScrollController();
  
  

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
              // color: ColorsClass.backgroundColorLight,
              // color: Theme.of(context).cardColor,
              color: Colors.black,
                 borderRadius: BorderRadius.vertical(
      top: Radius.circular(20.0),
    ),
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r),topRight:  Radius.circular(14.r))
      ),
      height: height ?? 0.5.sh,
      width: double.infinity,
    child: child,
    );

    
  }
}


