import 'dart:developer';

import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier{
  

UserModel userModel = UserModel();
  List<UserModel> usersList= [];
     login({required String email ,required String username})async{
    log('aaaaaaaaaaaaaaa');
       AuthServices authServices =AuthServices();

    await authServices.login(email:email,username :username).then((value)async{
userModel = value;
 
 await allUsers();
 print(userModel.email.toString() + userModel.username.toString());
       notifyListeners();
    });
            
  }


       allUsers()async{
    log('aaaaaaaaaaaaaaa');
       AuthServices authServices =AuthServices();

    await authServices.getAllUser(userModel.sId.toString()).then((value){

 usersList.assignAll(value);


       notifyListeners();
    });
            
  }


}