import 'dart:developer';

import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier{
  


   bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

UserModel userModel = UserModel();
  List<UserModel> usersList= [];
  
login({required String email ,required String username,required BuildContext context})async{
  isLoading=true;
  await _login(email: email,username: username,context: context);
   isLoading=false;

   notifyListeners();
}

     _login({required String email ,required String username ,required BuildContext context})async{
    log('aaaaaaaaaaaaaaa');
       AuthServices authServices =AuthServices();

    await authServices.login(email:email,username :username,context: context).then((value)async{
userModel = value;
 
 await allUsers(context: context);
 print(userModel.email.toString() + userModel.username.toString());
      //  notifyListeners();
    });
            
  }


       allUsers({required BuildContext context})async{
    log('aaaaaaaaaaaaaaa');
       AuthServices authServices =AuthServices();

    await authServices.getAllUser(userid:  userModel.sId.toString(),context: context).then((value){

 usersList.assignAll(value);


       notifyListeners();
    });
            
  }

register({required String email ,required String password, required String username,required BuildContext context})async{
  isLoading=true;
  await _register(email: email,username: username, password: password, context: context);
   isLoading=false;

   notifyListeners();
}

   _register({required String email ,required String password,  required String username ,required BuildContext context})async{
    log('aaaaaaaaaaaaaaa');
       AuthServices authServices =AuthServices();

    await authServices.register(email:email,username :username,password: password,  context: context).then((value)async{
userModel = value;
 
 await allUsers(context: context);
 print(userModel.email.toString() + userModel.username.toString());
      //  notifyListeners();
    });
            
  }
}