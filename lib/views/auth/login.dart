// import 'package:chatapp2/provider/auth_provider.dart';
// import 'package:chatapp2/views/chat/mainscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// import '../../services/message_services/message_service.dart';
// import '../../utils/text_field_decoration.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {

// TextEditingController emailController =TextEditingController(text:'ali@gmail.com' );
// TextEditingController nameController =TextEditingController(text:'ali' );

// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailController.dispose();
//     nameController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//    final authprov = Provider.of<AuthProvider>(context, listen: false);
//     return
//  Container(
 
//    padding: EdgeInsets.all(10),
//  constraints: BoxConstraints(maxHeight: double.infinity),
//    child: SingleChildScrollView(
 
//      child: Column(
//  mainAxisSize: MainAxisSize.min,
//        // mainAxisAlignment: MainAxisAlignment.center,
 
//        children: [
 
//          const    SizedBox(height: 40,),
 
//          TextField(
 
//            controller: emailController,
 
//            decoration: TextFieldClass.inputDecoration(context, hintText: 'Email'),
 
//          ),
 
//       const   SizedBox(height: 10,),
 
//          TextField(
 
//            controller: nameController,
 
//               decoration: TextFieldClass.inputDecoration(context, hintText: 'userName'),
 
//          ),
 
//     const     SizedBox(height: 10,),
 
//          Consumer<AuthProvider>(
 
//            builder: (context,val,_) {
 
//              return ElevatedButton(onPressed:val.isLoading == true ?null :()async{
 
//    await val.login(email:emailController.text.trim(),username: nameController.text.trim(),context: context);
 
   
 
   
 
//     Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
 
//              } ,
 
//               child:val.isLoading == false ? Text('LOGIN') : Center(child: CircularProgressIndicator(),));
 
//            }
 
//          ),
 
//        ],
 
//      ),
 
//    ),
 
//  );

   
//   }
// }