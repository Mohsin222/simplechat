import 'dart:convert';

import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:dio/dio.dart';
const baseURl ="http://192.168.18.72:5000/";
class AuthServices{


Future<UserModel> login({required String email ,required String username})async{

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
print(e);
  return Exception('error');  
});

}




Future<List<UserModel>> getAllUser(String userid)async{


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
print(e);
  return Exception('error');  
});

}



}