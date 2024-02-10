import 'dart:developer';

import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/room_mode.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier{
  



  //for login
   bool _isLoading = false;
  bool get isLoading => _isLoading;
bool showPass=false;

   showPassword(bool value) {
    value==true ? showPass=false : showPass=true;
   
    notifyListeners();
  }


  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


late TextEditingController emailController;
 late TextEditingController passwordController ;
  late  TextEditingController userNameController;


  //online users List 
  List<dynamic> onlineUsersList= [];

UserModel userModel = UserModel();
  // List<UserModel> usersList= [];
  List<RoomModel> roomsList= [];

   AuthProvider(){
    emailController = TextEditingController();
    passwordController = TextEditingController(); 
     userNameController = TextEditingController();
  }
 
  
login({required String email ,required String password,required BuildContext context})async{
  isLoading=true;
  await _login(email: email,password: password,context: context);
   isLoading=false;

   notifyListeners();
}

     _login({required String email ,required String password ,required BuildContext context})async{

       AuthServices authServices =AuthServices();

    await authServices.login(email:email,password :password,context: context).then((value)async{
  userModel = value;
 
if(userModel.sId !=null)
 await AllMyChats(context: context);
 print(userModel.email.toString() + userModel.username.toString());
      //  notifyListeners();
    });
            
  }


       AllMyChats({required BuildContext context})async{
    log('aaaaaaaaaaaaaaa');
       AuthServices authServices =AuthServices();

    await authServices.getMyAllChats(context: context).then((value){

 roomsList.assignAll(value);


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
 
 await AllMyChats(context: context);
 print(userModel.email.toString() + userModel.username.toString());
      //  notifyListeners();
    });
            
  }



  getUserDetails(BuildContext context)async{
await _getUserDetails(context);
  }


  _getUserDetails(BuildContext context)async{
    
       AuthServices authServices =AuthServices();

    await authServices.getUserDetails(context: context).then((value)async{
  userModel = value;
//  notifyListeners();
if(userModel.sId !=null)
 await AllMyChats(context: context);
 print(userModel.email.toString() + userModel.username.toString());
       notifyListeners();
    });
  }




checkOnlineUsersAndUpdadeStatus(){
// for (var i = 0; i < usersList.length; i++) {
//   for (var j = 0; j < onlineUsersList.length; j++) {
//     if(usersList[i].sId == onlineUsersList[j]['userId']){
// usersList[i].isOnline=true;
//     }else{
//       log('not Matcj');
//     }
//   }
// }
}



    @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }
}