import 'dart:developer';
import 'dart:io';

import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:chatapp2/services/message_services/message_service.dart';
import 'package:chatapp2/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../provider/message_provider.dart';

class IndividualChatPage extends StatefulWidget {
  final UserModel? userModel;
  const IndividualChatPage({super.key, required this.userModel});

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  late IO.Socket _socket;
  final TextEditingController _messageInputController = TextEditingController();


    _sendMessage() async{
   UserModel userModel=   Provider.of<AuthProvider>(context, listen: false).userModel;
    MessageService messageService =MessageService();
   await Provider.of<MessageProvider>(context, listen: false).sendMessage(clientId: widget.userModel!.sId!,userModel:userModel ,  message: _messageInputController.text.trim());

   _socket.emit('send-msg', {
      'to': widget.userModel!.sId,
      'message':_messageInputController.text.trim()
   
    });
 

 
    Provider.of<MessageProvider>(context, listen: false).addNewMessage(

MsgModel(message:  _messageInputController.text.trim(),
fromSelf: true
)
      );
         _messageInputController.clear();

  }
@override
  void initState() {
    super.initState();
    //Important: If your server is running on localhost and you are testing your app on Android then replace http://localhost:3000 with http://10.0.2.2:3000
    _socket = IO.io(
      Platform.isIOS ? 'http://192.168.18.72:5000' : 'http://192.168.18.72:5000',
 <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    }

      // IO.OptionBuilder().setTransports(['websocket'],
      // )
      // .setQuery(
      //     {'username': widget.userModel!.username}).build(),
    );
       _socket.connect();
    _connectSocket();
   UserModel userModel=   Provider.of<AuthProvider>(context, listen: false).userModel;
      WidgetsBinding.instance.addPostFrameCallback((_)  => {

Provider.of<MessageProvider>(context,listen:false).getMessageChart(clientId: widget.userModel!.sId!,
userModel: userModel

)
    
  });
  }
  _connectSocket() {

   
 
    _socket.onConnectError((data) { print('Connect Error: $data');
     
          // ScaffoldMessenger.of(context).showSnackBar(snackbar(data));
    }
    );
    _socket.onDisconnect((data) {
      
  
          // ScaffoldMessenger.of(context).showSnackBar(snackbar(data));
    });
     _socket.emit("add-user", Provider.of<AuthProvider>(context,listen:false).userModel.sId);

      _socket.onConnect((data) {
      print('Connection established');
       _socket.on("msg-recieve",
   (dd){


    log('GET MESSAGE'+dd['message'].toString());
//     Provider.of<AuthProvider>(context, listen: false).addNewMessage(

// MsgModel(message:  dd['message'].toString(),
// fromSelf: false
// )
//       );

 Provider.of<MessageProvider>(context, listen: false).addNewMessage(

MsgModel(message:  dd['message'],
fromSelf: false
)
      );


          // ScaffoldMessenger.of(context).showSnackBar(snackbar(dd['message']));

         
   }
//     (data) {
    
//     Provider.of<AuthProvider>(context, listen: false).addNewMessage(

// MsgModel(message:  data.toString(),
// fromSelf: true
// )
//       );
//    }
   );
  
    });


    
  }

   snackbar(String message){
    return SnackBar(
            content:  Text(message),
            backgroundColor: (Colors.black),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {
              },
            ),
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _socket.dispose();
  }

  @override
  Widget build(BuildContext context) {
      // final authProv = Provider.of<AuthProvider>(context,listen:false).getMessageChart(clientId: widget.userModel!.sId!);
    return  Scaffold(
      appBar: AppBar(title: Text(widget.userModel!.username ?? ''),),

      body: Column(children: [
            Expanded(
            child: Consumer<MessageProvider>(
              builder: (_, provider, __) => ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final message = provider.messagesList[index];
                  return Wrap(
                    alignment: message.fromSelf ==true
                        ? WrapAlignment.end
                        : WrapAlignment.start,
                    children: [
                      Card(
                        color:message.fromSelf ==true
                            ? Theme.of(context).primaryColorLight
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            message.fromSelf ==true
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                            children: [
                              Text(message.message.toString()),
                              //  Text(.toString()),
                              // Text(
                              //   DateFormat('hh:mm a').format(message.createdAt ?),
                              //   style: Theme.of(context).textTheme.bodySmall,
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: provider.messagesList.length,
              ),
            ),
          ),
                  Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageInputController,
                      decoration: const InputDecoration(
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: ()async {
                      if (_messageInputController.text.trim().isNotEmpty) {
                    await    _sendMessage();
                      }
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          )
      ],)
    );
  }
}