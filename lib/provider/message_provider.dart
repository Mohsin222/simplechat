import 'dart:developer';
import 'dart:io';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:chatapp2/services/message_services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/msg_model.dart';

class MessageProvider extends  ChangeNotifier {
  List<MsgModel> messagesList =[];
      late IO.Socket socket;
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
 File? image;
   final picker = ImagePicker();
  // Implementing the image picker
  Future openImagePicker(BuildContext context) async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {

        image = File(pickedImage.path);
notifyListeners();
    }else{
      // image = null;
      notifyListeners();
    }
    Navigator.pop(context);
  }

  makeImageNull(){
    image =null;
    notifyListeners();
  }


 
       sendMessage({required String clientId, required UserModel userModel ,required String? message})async{
    log('aaaaaaaaaaaaaaa');
         MessageService messageService =MessageService();

         if(image !=null) {
         await messageService.uploadImageToCloudinary(image!.path).then((value)async {
          log(value.toString() +'aaaaaaa');
        await     messageService.sendMessage(clientId: clientId,myId: userModel.sId!,message: message,image: value).then((val){

socket.emit('send-msg', {
      'to': clientId,
      'message':message,
      'image':value
 
   
    });

    addNewMessage(

MsgModel(message:  message,
fromSelf: true,
image:value

)
      );
makeImageNull();
        });

// messagesList.last.image=value;





       notifyListeners();
         });
         }else{
    await messageService.sendMessage(clientId: clientId,myId: userModel.sId!,message: message).then((value){

     socket.emit('send-msg', {
      'to': clientId,
      'message':message,
      'image':''
 
   
    });

        addNewMessage(

MsgModel(message:  message,
fromSelf: true,
image:''

)
      );
       notifyListeners();
    });
         }
            
  }
}