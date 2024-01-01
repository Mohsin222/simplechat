import 'package:chatapp2/utils/text_field_decoration.dart';
import 'package:chatapp2/views/chat/mainscreen.dart';
import 'package:chatapp2/widget/custom_btn1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';

class LoginWidget extends StatefulWidget {
   LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var spacing =    SizedBox(height: 15,);

      final loginFormKey = GlobalKey<FormState>();

TextEditingController emailController =TextEditingController();

TextEditingController userNameController =TextEditingController();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: SingleChildScrollView(
        child: Form(
          key: loginFormKey,
          child: Column(
            children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
                  "Login",
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
            ),
            
            spacing,
            TextFormField(
              controller: userNameController,
          decoration: TextFieldClass.inputDecoration(context, hintText: 'userName',suffixIcon: Icon(Icons.person)),
            ),
               
              
          spacing,
            spacing,
            Consumer<AuthProvider>(
              builder: (context,val,_) {
                return CustomBtn(
                childText: 'Login',
                loading: val.isLoading,
                onPress:val.isLoading == true ?null :()async{
await val.login(email:emailController.text.trim(),username: userNameController.text.trim(),context: context);


 Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
          } ,
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
