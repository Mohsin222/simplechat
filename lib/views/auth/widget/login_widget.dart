import 'package:chatapp2/constants/sizes.dart';
import 'package:chatapp2/constants/text_file.dart';
import 'package:chatapp2/utils/text_field_decoration.dart';
import 'package:chatapp2/views/chat/mainscreen.dart';
import 'package:chatapp2/widget/custom_btn1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';

class LoginWidget extends StatefulWidget {
  final double? height;
  const LoginWidget({super.key, this.height});

  static showSheet({required BuildContext context, double? height}) {
    return showModalBottomSheet(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        //  isScrollControlled: true,

        // clipBehavior:Clip.hardEdge ,

        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (context) {
          return LoginWidget(
            height: height,
          );
        });
  }

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       
      height: widget.height,
      constraints: BoxConstraints(maxHeight: widget.height ?? 0.7.sh),
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: EdgeInsets.all(SizesClass.md),
      child: Form(
        key: loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ConstantTexts.loginText,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700)
                      
                      ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:  Icon(
                        Icons.close_rounded,
                        size: SizesClass.iconMd,
                        color: Colors.red,
                      ))
                ],
              ),
              SizedBox(height: SizesClass.defaultSpace),
              TextFormField(
                controller: emailController,
                // decoration: TextFieldClass.inputDecoration(context,
                //     hintText: 'Email', suffixIcon: const Icon(Icons.person)),

                decoration:const InputDecoration(hintText:'Email' ,suffixIcon:  Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              SizedBox(height: SizesClass.defaultSpace),
              TextFormField(
                controller: userNameController,
decoration:const InputDecoration(hintText:'userName' ,suffixIcon:  Icon(Icons.password)),

                // decoration: TextFieldClass.inputDecoration(context,
                //     hintText: 'userName', suffixIcon: const Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter userName';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: SizesClass.spaceBtwItems,
              ),
              Consumer<AuthProvider>(builder: (context, val, _) {
                return CustomBtn(
                  childText: ConstantTexts.loginText,
                  loading: val.isLoading,
                  onPress: val.isLoading == true
                      ? null
                      : () async {
                          if (loginFormKey.currentState!.validate()) {
                            await val.login(
                                email: emailController.text.trim(),
                                username: userNameController.text.trim(),
                                context: context);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ));
                          }
                        },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
