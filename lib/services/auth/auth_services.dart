import 'dart:convert';
import 'dart:developer';

import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/utils/localStorage/localStorage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/room_mode.dart';

const baseURl = "http://192.168.18.72:5000/";

class AuthServices {

  Dio dio = Dio();
  final snackbar = SnackBar(
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
  Future login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Dio dio = Dio();

    return dio.post(baseURl + "api/auth/login", data: {
     
      "email": email,
       "password": password,
      // "password": "123"
    }).then((value) {
      log(value.statusCode.toString() + '123589-');
      Provider.of<AuthProvider>(context, listen: false).isLoading = false;

      UserModel userModel = UserModel.fromJson(value.data['user']);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      SharedPreferencesService.saveAuthToken(value.data['token']);

      return userModel;
    }).catchError((e) {
      log(e.toString() + '-------');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Provider.of<AuthProvider>(context, listen: false).isLoading = false;
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2345677');
      return throw Exception('error');
    });
  }

//   Future<List<UserModel>> getAllUser(
//       {required String userid, required BuildContext context}) async {
//         var token =    SharedPreferencesService.getAuthToken(); 
//     List<UserModel> users = [];
//     log(userid.toString() +'GGGGGGGGGGGGGGG');

// var headers = {
//   'Authorization': 'Bearer $token'
// };
//     return dio
//         .get(
//       baseURl + "api/auth/allusers/6591d45b2f746f417b5a4efc",
//       options: Options(

//         headers: headers
//       )
//     )
//         .then((value) {
//       var list = value.data as List;
// print(list);
//       for (var element in list) {
//         UserModel userModel = UserModel.fromJson(element);

//         users.add(userModel);
//       }
//       return users;
//     }).catchError((e) {
//       Provider.of<AuthProvider>(context, listen: false).isLoading = false;
//       log(e.toString());
//       //  throw Exception('error');
//     });
//   }
//get my allChats
  Future<List<RoomModel> >getMyAllChats(
      {required BuildContext context}) async {
        var token =    SharedPreferencesService.getAuthToken(); 
    
List<RoomModel> rooms =[];

var headers = {
  'Authorization': 'Bearer $token'
};
    return dio
        .get(
      // baseURl + "api/auth/allusers/6591d45b2f746f417b5a4efc",
            baseURl + "api/messages/getAllMyRoom",

      options: Options(

        headers: headers
      )
    )
        .then((value) {
       

           var list = value.data['data'] as List;
print(list);
      for (var element in list) {
      RoomModel roomModel = RoomModel.fromJson(element);

        rooms.add(roomModel);
      }



      return rooms;
    }).catchError((e) {
      Provider.of<AuthProvider>(context, listen: false).isLoading = false;
      log(e.toString());
      //  throw Exception('error');
    });
  }














//register
  Future<UserModel> register(
      {required String email,
      required String password,
      required String username,
      required BuildContext context}) async {
    Dio dio = Dio();

    return dio.post(baseURl + "api/auth/register", data: {
      "username": username,
      "email": email,
      "password": password
    }).then((value) {
      UserModel userModel = UserModel.fromJson(value.data['user']);

      return userModel;
    }).catchError((e) {
      Provider.of<AuthProvider>(context, listen: false).isLoading = false;
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2345677');
      return Exception('error');
    });
  }




    Future<UserModel> getUserDetails({

      required BuildContext context}) async {
        print('aaaaaaaaaaaa');
    Dio dio = Dio();
        var token =    SharedPreferencesService.getAuthToken(); 

    var headers = {
  'Authorization': 'Bearer $token'
};   
    return dio.get(baseURl + "api/user/getUserData/",
    
          options: Options(

        headers: headers
      )
    
    ).then((value) {

      log(value.data.toString());
      UserModel userModel = UserModel.fromJson(value.data['user']);

      return userModel;
    }).catchError((e) {
      Provider.of<AuthProvider>(context, listen: false).isLoading = false;
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa2345677' +e.toString());
      return Exception('error');
    });
  }
}
