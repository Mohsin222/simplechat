import 'dart:developer';

import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:chatapp2/services/message_services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/msg_model.dart';

class MessageProvider extends  ChangeNotifier {
  List<MsgModel> messagesList =[];
       getMessageChart({required String clientId , required UserModel userModel})async{
    log('aaaaaaaaaaaaaaa');
     MessageService messageService =MessageService();

    await messageService.getMessages(clientId: clientId,myId: userModel.sId!).then((value){

      messagesList.assignAll(value);
       notifyListeners();
    });
            
  }
    addNewMessage(MsgModel message) {
    messagesList.add(message);
    notifyListeners();
  }


 
       sendMessage({required String clientId, required UserModel userModel ,required String? message})async{
    log('aaaaaaaaaaaaaaa');
         MessageService messageService =MessageService();

    await messageService.sendMessage(clientId: clientId,myId: userModel.sId!,message: message).then((value){

     
       notifyListeners();
    });
            
  }
}