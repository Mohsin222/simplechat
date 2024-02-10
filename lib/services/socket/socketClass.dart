
import 'dart:developer';
import 'dart:io';

import 'package:chatapp2/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService{
 IO.Socket? socket;

void connect(BuildContext context){
     socket = IO.io(
      Platform.isIOS ? 'http://192.168.18.72:5000' : 'http://192.168.18.72:5000',
 <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    }

    );
   socket!.connect();
socket!.on('connect', (_) => print('connect@@: ${socket!.id}'));
String? id =Provider.of<AuthProvider>(context, listen: false).userModel.sId;
  socket!.emit('OnlineUser','id');
if(id !=null){

}else{
  log('MY ID IS NULL');
}


//  socket!.on('AllOnlineUsers',(data){
//   Provider.of<AuthProvider>(context, listen: false).onlineUsersList =data;



//  log(  Provider.of<AuthProvider>(context, listen: false).onlineUsersList.toString() +'---' );

//    Provider.of<AuthProvider>(context, listen: false).checkOnlineUsersAndUpdadeStatus();
//  });

// socket!.on('AllOnlineUsers',(data){

//   Provider.of<AuthProvider>(context, listen: false).checkOnlineUsersAndUpdadeStatus();
//   log('CONNNEEEEEEEEEE');
// });
}

  void disconnect() {

    log('SOCKET DIS*CONNECTED');

    socket!.disconnect();
  }
}