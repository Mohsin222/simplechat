import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/views/chat/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../services/message_services/message_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

TextEditingController emailController =TextEditingController(text:'ali@gmail.com' );
TextEditingController nameController =TextEditingController(text:'ali' );

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final authprov = Provider.of<AuthProvider>(context, listen: false);
    return  Scaffold(
body: Container(
  padding: EdgeInsets.all(10),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
          SizedBox(height: 40,),
      TextField(
        controller: emailController,
      ),
      SizedBox(height: 10,),
      TextField(
        controller: nameController,
      ),
      SizedBox(height: 10,),
      Center(
  child: ElevatedButton(onPressed: ()async{
await authprov.login(email:emailController.text.trim(),username: nameController.text.trim());


Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
  }, child: Text('LOGIN')),
),
    ],
  ),
)

    );
  }
}