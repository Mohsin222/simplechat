import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/utils/text_field_decoration.dart';
import 'package:chatapp2/widget/custom_btn1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../chat/mainscreen.dart';

class SignUpWidget extends StatefulWidget {
   SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  var spacing =    SizedBox(height: 15,);

       final signUpformkey = GlobalKey<FormState>();

TextEditingController emailController =TextEditingController();

TextEditingController userNameController =TextEditingController();

TextEditingController passwordController =TextEditingController();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: SingleChildScrollView(
        child: Form(
          key: signUpformkey,
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
           TextFormField(
            controller: emailController,
          decoration: TextFieldClass.inputDecoration(context, hintText: 'Email',suffixIcon:const Icon(Icons.person)),
           
                  validator: (value) {
    if (value == null || value.isEmpty) {     
return 'Please enter email';
    }
    return null;
  },
            ),
            
            spacing,
            TextFormField(
              controller: userNameController,
          decoration: TextFieldClass.inputDecoration(context, hintText: 'userName',suffixIcon: Icon(Icons.person)),
           
                  validator: (value) {
    if (value == null || value.isEmpty) {     
return 'Please enter userName';
    }
    return null;
  },
            ),
           spacing,
            TextFormField(
              controller: passwordController,
          decoration: TextFieldClass.inputDecoration(context, hintText: 'password',suffixIcon: Icon(Icons.person)),
           validator: (value) {
    if (value == null || value.isEmpty) {     
return 'Please enter password ';
    }
    return null;
  },
           
            ),
              
          spacing,
            spacing,
               Consumer<AuthProvider>(
              builder: (context,val,_) {
                return CustomBtn(
                   loading: val.isLoading,
                  onPress:val.isLoading == true ?null: ()async{
    if (signUpformkey.currentState!.validate()) {
  await val.register(email:emailController.text.trim(),  password: passwordController.text.trim()  ,username: userNameController.text.trim(),context: context);
   
ScaffoldMessenger.of(context).showSnackBar(
  
       const SnackBar(content: Text('Processing Data')),
       
      );
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));

    }

                  },
                childText: 'Register',
                
                );
              }
            ),
            ],
          ),
        ),
      ),
    );
  }
}
