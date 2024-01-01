import 'package:chatapp2/utils/text_field_decoration.dart';
import 'package:chatapp2/widget/custom_btn1.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
   SignUpWidget({super.key});


  var spacing =    SizedBox(height: 15,);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
                "Register",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                )
            ),
          
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:const Icon(Icons.close_rounded,color: Colors.red,))
        ],
          ),
        spacing,
         TextField(
        decoration: TextFieldClass.inputDecoration(context, hintText: 'Email',suffixIcon:const Icon(Icons.person)),
          ),
    
          spacing,
          TextField(
        decoration: TextFieldClass.inputDecoration(context, hintText: 'userName',suffixIcon: Icon(Icons.person)),
          ),
         spacing,
          TextField(
        decoration: TextFieldClass.inputDecoration(context, hintText: 'password',suffixIcon: Icon(Icons.person)),
          ),
      
  spacing,
    spacing,
    CustomBtn(
    childText: 'Register',
    
    ),
          ],
        ),
      ),
    );
  }
}
