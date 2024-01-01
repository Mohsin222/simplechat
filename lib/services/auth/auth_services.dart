import 'dart:convert';

import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
const baseURl ="http://192.168.18.72:5000/";
class AuthServices{


Future<UserModel> login({required String email ,required String username,required BuildContext context})async{

  Dio dio =Dio();


 return   dio.post(baseURl+"api/auth/login",
 data: {
      "username":username,
    "email":email,
    "password":"123"
 }
 
 ).then((value) {



UserModel  userModel =UserModel.fromJson(value.data['user']);

return userModel;
}).catchError((e){
  Provider.of<AuthProvider>(context, listen: false).isLoading=false;
print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2345677');
  return Exception('error');  
});

}




Future<List<UserModel>> getAllUser({required String userid ,required BuildContext context})async{


List<UserModel> users=[];
  Dio dio =Dio();


 return   dio.get(baseURl+"api/auth/allusers/$userid",

 ).then((value) {






var list =value.data as List;
print(list);

for (var element in list) {
UserModel  userModel =UserModel.fromJson(element);

  users.add(userModel);
}
return users;
}).catchError((e){
    Provider.of<AuthProvider>(context, listen: false).isLoading=false;
print(e);
  return Exception('error');  
});

}



}