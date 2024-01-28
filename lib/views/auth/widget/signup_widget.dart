import 'package:chatapp2/constants/text_file.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/utils/text_field_decoration.dart';
import 'package:chatapp2/widget/custom_btn1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/sizes.dart';
import '../../chat/mainscreen.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {

  final signUpformkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Form(
          key: signUpformkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstantTexts.signUp,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        size: SizesClass.iconMd,
                        color: Colors.red,
                      ))
                ],
              ),
          SizedBox(height: SizesClass.spaceBtwItems,),
    
              TextFormField(
                controller: emailController,
       decoration:const InputDecoration(hintText:'email' ,suffixIcon:  Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
     SizedBox(height: SizesClass.spaceBtwItems,),
              TextFormField(
                controller: userNameController,
                // decoration: TextFieldClass.inputDecoration(context, hintText: 'userName',suffixIcon: Icon(Icons.person)),
               
                 decoration:const InputDecoration(hintText:'UserName' ,suffixIcon:  Icon(Icons.person)),
         

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter userName';
                  }
                  return null;
                },
              ),
      SizedBox(height: SizesClass.spaceBtwItems,),
              TextFormField(
                controller: passwordController,
                // decoration: TextFieldClass.inputDecoration(context, hintText: 'password',suffixIcon: Icon(Icons.person)),

                 decoration:const InputDecoration(hintText:'Password' ,suffixIcon:  Icon(Icons.password)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password ';
                  }
                  return null;
                },
              ),
             SizedBox(height: SizesClass.spaceBtwItems,),
      
              Consumer<AuthProvider>(builder: (context, val, _) {
                return CustomBtn(
                  loading: val.isLoading,
                  onPress: val.isLoading == true
                      ? null
                      : () async {
                          if (signUpformkey.currentState!.validate()) {
                            await val.register(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                username: userNameController.text.trim(),
                                context: context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ));
                          }
                        },
                  childText: 'Register',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
