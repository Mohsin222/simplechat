import 'dart:convert';
import 'dart:developer';


import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/snackbar.dart';
const baseURl ="http://192.168.18.72:5000/";
class AuthServices{

  final snackbar=  SnackBar(
  backgroundColor: Colors.purple,
      
              content: Text('e.toString()'),
              duration: Duration(seconds: 3),
              action: SnackBarAction(
              textColor: Colors.red,
                label: '',
                onPressed: () {
                  // Perform some action when the "Undo" button is pressed
                  // (optional)
                },
              ),
            );
Future login({required String email ,required String username,required BuildContext context})async{

  Dio dio =Dio();


 return   dio.post(baseURl+"api/auth/login",
 data: {
      "username":username,
    "email":email,
    "password":"123"
 }
 
 ).then((value) {
log(value.statusCode.toString()  +'123589-');


UserModel  userModel =UserModel.fromJson(value.data['user']);
  ScaffoldMessenger.of(context).showSnackBar(snackbar);

return userModel;
}).catchError((e){
log(e.toString()  +'-------');
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
  Provider.of<AuthProvider>(context, listen: false).isLoading=false;
print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2345677');
  return throw Exception('error');  
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
  return throw Exception('error');  
});

}





//register
Future<UserModel> register({required String email ,required String password, required String username,required BuildContext context})async{

  Dio dio =Dio();


 return   dio.post(baseURl+"api/auth/register",
 data: {
      "username":username,
    "email":email,
    "password":password
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

}