import 'dart:developer';

import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/utils/localStorage/localStorage.dart';
import 'package:chatapp2/views/chat/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}




class _SplashScreenState extends State<SplashScreen> {
  getUserDetail()async{
await   Provider.of<AuthProvider>(context, listen: false).getUserDetails(context);
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
}


checkAlreadyLogin()async{
var token =await SharedPreferencesService.getAuthToken();

log(token.toString());
if(token !=null ){
await  getUserDetail();
}else{
  Navigator.pushNamed(context, '/startScreen');
}
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_){
 checkAlreadyLogin();  });

  }

  @override
  Widget build(BuildContext context) {

 
    return  Scaffold(
      appBar: AppBar(title: Text('Splash'),),
    );
  }
}