import 'dart:developer';
import 'dart:io';

import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/model/msg_model.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:chatapp2/services/message_services/message_service.dart';
import 'package:chatapp2/views/auth/login.dart';
import 'package:chatapp2/views/chat/widget/user_tile.dart';
import 'package:chatapp2/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../provider/message_provider.dart';
import '../auth/widget/auth_bottom_sheet.dart';

class IndividualChatPage extends StatefulWidget {
  final UserModel? userModel;
  const IndividualChatPage({super.key, required this.userModel});

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  late IO.Socket socket;
  final TextEditingController _messageInputController = TextEditingController();


    _sendMessage() async{
      var msgProv =Provider.of<MessageProvider>(context, listen: false);
   UserModel userModel=   Provider.of<AuthProvider>(context, listen: false).userModel;
    MessageService messageService =MessageService();
   await Provider.of<MessageProvider>(context, listen: false).sendMessage(clientId: widget.userModel!.sId!,userModel:userModel ,  message: _messageInputController.text.trim());


 

 
//     Provider.of<MessageProvider>(context, listen: false).addNewMessage(

// MsgModel(message:  _messageInputController.text.trim(),
// fromSelf: true,
// image: ''

// )
//       );
         _messageInputController.clear();

        //  msgProv.makeImageNull();

  }
@override
  void initState() {

    
     var msgProv =Provider.of<MessageProvider>(context, listen: false);

    super.initState();
    //Important: If your server is running on localhost and you are testing your app on Android then replace http://localhost:3000 with http://10.0.2.2:3000
    socket = IO.io(
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
      msgProv.socket=socket;
socket.connect();
    _connectSocket();
   UserModel userModel=   Provider.of<AuthProvider>(context, listen: false).userModel;
      WidgetsBinding.instance.addPostFrameCallback((_)  => {

Provider.of<MessageProvider>(context,listen:false).getMessageChart(clientId: widget.userModel!.sId!,
userModel: userModel

)
    
  });
  }
  _connectSocket() {
      var msgProv =Provider.of<MessageProvider>(context, listen: false);
   
 
   msgProv.socket.onConnectError((data) { print('Connect Error: $data');
    log('Connect Error');
          // ScaffoldMessenger.of(context).showSnackBar(snackbar(data));
    }
    );
    msgProv.socket.onDisconnect((data) {
      
  log('DISCONNECT');

  
          // ScaffoldMessenger.of(context).showSnackBar(snackbar(data));
    });
    msgProv.socket.emit("add-user", msgProv.roomModel!.sId);
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Connected')));
     msgProv.socket.onConnect((data) {
        log('Connection established');
      print('Connection established');

      msgProv.socket.on("userConnected",(d){
        log(d.toString());
      });
       msgProv.socket.on("msg-recieve",
   (dd){


    log('GET MESSAGE'+dd['message'].toString());
//     Provider.of<AuthProvider>(context, listen: false).addNewMessage(
 MsgModel msgModel=MsgModel(message:  dd['message'],
fromSelf: false,
image: dd['image'] ?? ''
);
msgProv.addNewMessage(
msgModel

      );


          // ScaffoldMessenger.of(context).showSnackBar(snackbar(dd['message']));

         
   }

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
   _messageInputController.dispose();
          // var msgProv =Provider.of<MessageProvider>(context, listen: false);

    //  msgProv.socket.emit("disconnect", Provider.of<AuthProvider>(context,listen:false).userModel.sId);
    
    // TODO: implement dispose
    super.dispose();
//  msgProv.socket.emit('disconnect',{
//   "roomId":msgProv.roomModel!.sId
//  });
  //  msgProv.socket.dispose();
      // WidgetsBinding.instance.addPostFrameCallback((_)  => {

    // TODO: implement initState
if(mounted){
  socket.dispose();
}
  // });
  }

  @override
  Widget build(BuildContext context) {
   final msgProvider = Provider.of<MessageProvider>(context,listen:false);
   final authProvider = Provider.of<AuthProvider>(context,listen:false);
    return  Scaffold(
         backgroundColor: ColorsClass.backgroundColorDark,
      // appBar: AppBar(title: Text(widget.userModel!.username ?? ''),
      
      // actions: [Text(msgProvider.roomModel!.sId.toString()),SizedBox(width: 10,)],
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                      Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 15.w ),
                        child: InkWell(onTap: ()=>Navigator.pop(context), child: Icon(Icons.arrow_back,color: Colors.white,)),
                      ),

            Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10, ),
              // child: UserTile(onPress: (){},userModel: widget.userModel,
              // // height:100.h,
              // // width: 70.h,
              // ),
              child: Row(
                children: [
                 Container(
          width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amberAccent,
          
        ),
          clipBehavior: Clip.hardEdge,
        child: Image(image: NetworkImage('https://images.unsplash.com/photo-1704027115927-9f67ab4e39dc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2NHx8fGVufDB8fHx8fA%3D%3D'),fit: BoxFit.cover,),
            ), 
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Text(
widget.userModel!.username.toString(),
        style: TextStyle(
        fontSize: 22.sp,
        // color: ColorsClass.primaryTextColorDark,
        color: ColorsClass.textColor2,
        fontWeight: FontWeight.w500,
        )
        ),
        SizedBox(height: 10.h,),
         Text(
       widget.userModel!.email.toString(),
        style: TextStyle(
        fontSize: 16.sp,
        // color: ColorsClass.primaryTextColorDark,
        color: ColorsClass.textColor2,
        fontWeight: FontWeight.w500,
        )
        ),
          ],
            )
                ],
              ),
            ),
          
             
                CustomMainBottomSheet(
                  height: 0.7.sh,
                  child: Consumer<MessageProvider>(
                    builder: (_, provider, __) => ListView.separated(
             
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        final message = provider.messagesList[index];
                              
                           
                        print(message.image);
                        return Wrap(
                          alignment: message.fromSelf ==true
                              ? WrapAlignment.end
                              : WrapAlignment.start,
                          children: [
        
                           if(message.fromSelf==true)
        MyTile(msgModel: message)
        else
        ClientTile(msgModel: message),
              
             
                          ],
                        );
                      },
                      separatorBuilder: (_, index) =>  SizedBox(
                        height: 10.h,
                      ),
                      itemCount: provider.messagesList.length,
                    ),
                  ),
                ),
           



                      Container(
            
                decoration: BoxDecoration(

     borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)),
                          // border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                       Consumer<MessageProvider>(
                builder: (context,val,_) {
                  return val.image !=null ? GestureDetector(
                  onLongPress: (){
                    val.makeImageNull();
                  },
                    child: Container(
                      height: 100,
                      width: 90,
                      child: Image.file(val.image!)),
                  ):Container();
                }
              ),
                      Row(
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
                            showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BottomSheetWidget(onpress: ()async{
                               await msgProvider.openImagePicker(context);
                              },);
                            });
                            },
                            icon: const Icon(Icons.image),
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
                    ],
                  ),
                ),
              )
          ],),
        ),
      )
    );
  }

}



class ClientTile extends StatelessWidget {
 final MsgModel msgModel;
    
  const ClientTile({super.key, required this.msgModel});

  @override
  Widget build(BuildContext context) {
    return                           Container(
    // padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
width: 260.w,
// height: 58,

alignment: Alignment.centerLeft,
child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
      if(msgModel.image !=null && msgModel.image !='')
  Container(
    child: Image(image: NetworkImage(msgModel.image!,),
    
    errorBuilder: (context, error, stackTrace) {
      return Image.asset('assets/images/image.png');
    },
    ),
  ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
     width: 260.w,
          decoration: BoxDecoration(
borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
color: Colors.black),
          child: Text(
            
                  msgModel.message.toString(),
            
                  style: TextStyle(
            
                      fontSize: 17,
            
                      fontWeight: FontWeight.w400,
            
                      color: ColorsClass.primaryTextColorLight
            
                  )
            
              ),
        ),
  ],
),


);
  }
}



class MyTile extends StatelessWidget {
 final MsgModel msgModel;
    
  const MyTile({super.key, required this.msgModel});

  @override
  Widget build(BuildContext context) {
    return                           Container(
      //  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
width: 260.w,
// height: 58,

child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  if(msgModel.image !=null && msgModel.image !='')
  Container(
    child: Image(image: NetworkImage(msgModel.image!,),
    
    errorBuilder: (context, error, stackTrace) {
      return Image.asset('assets/images/image.png');
    },
    ),
  ),
     Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
     width: 260.w,
          decoration: const BoxDecoration(
borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
color: Colors.blueAccent
          ),
       child: Text(
              msgModel.message.toString(),
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
              )
          ),
     ),

    //  Text(
    //         msgModel.message.toString(),
    //         style: TextStyle(
    //             fontSize: 17,
    //             fontWeight: FontWeight.w400,
    //         )
    //     ),

  ],
)

);
  }
}


