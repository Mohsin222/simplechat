import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/provider/message_provider.dart';
import 'package:chatapp2/views/chat/individual_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, this.userModel, required this.onPress, this.width, this.height});
  final UserModel? userModel;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      // onTap: () async {
      //   final authProv = Provider.of<AuthProvider>(context, listen: false);
      //   final msgProv = Provider.of<MessageProvider>(context, listen: false);
      //   // MessageService messageService =MessageService();
      //   await msgProv.getRoomId(
      //       clinetModel: userModel!, myModel: authProv.userModel);
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => IndividualChatPage(
      //                 userModel: userModel,
      //               )));
      // },
      onTap: onPress,
      // title: Text(userModel!.username ?? '',),

      leading: Container(
        width:width ?? 70.w,
height:height ?? 70.h,
decoration: BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.amberAccent,
  
),
  clipBehavior: Clip.hardEdge,
child: Image(image: NetworkImage('https://images.unsplash.com/photo-1704027115927-9f67ab4e39dc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2NHx8fGVufDB8fHx8fA%3D%3D'),fit: BoxFit.cover,),
      ),
    title:  Text(
userModel!.username ?? '',
style: TextStyle(
fontSize: 18.sp,
// color: ColorsClass.primaryTextColorDark,
color:Colors.white,
fontWeight: FontWeight.w500,
)
),
      // subtitle: Text(userModel!.email ?? ''),
      subtitle: Text(
userModel!.email ?? '',
style: TextStyle(
fontSize: 18.sp,
fontWeight: FontWeight.w300,
// color: ColorsClass.primaryTextColorDark
color: ColorsClass.textColor2,
)
),
    );
  }
}
