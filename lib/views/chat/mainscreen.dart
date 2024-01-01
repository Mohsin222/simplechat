import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/provider/message_provider.dart';
import 'package:chatapp2/views/chat/individual_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../services/message_services/message_service.dart';
import '../auth/widget/auth_bottom_sheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//       WidgetsBinding.instance.addPostFrameCallback((_){
// Provider.of<AuthProvider>(context, listen: false).allUsers();
//   });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Consumer<AuthProvider>(
      //   builder: (context ,val ,_) {
      //     return  Text(val.userModel.email.toString());
      //   }
      // ),

      // ),
            backgroundColor: ColorsClass.backgroundColorDark,
      appBar: AppBar(
        
        toolbarHeight: 100.h,
        backgroundColor: ColorsClass.backgroundColorDark,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("Welcome ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
        Consumer<AuthProvider>(
        builder: (context ,val ,_) {
          return  Text(val.userModel.email.toString());
        }
      )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
        ],
      ),
      // body: Consumer<AuthProvider>(
      //   builder: (context ,val ,_) {
      //     return ListView.builder(
      //       itemCount: val.usersList.length,
      //       itemBuilder: (context,index){
      //       return UserTile(userModel: val.usersList[index],);
      //     });
      //   }
      // ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Story",
                    style: TextStyle(
                      fontSize: 22.829790115356445,
                      fontWeight: FontWeight.w400,
                      color:ColorsClass.primaryColorLight
                    )),
                Text("See All",
                    style: TextStyle(
                         color:ColorsClass.textColor2,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),


       
              ],
            ),
          ),
          SizedBox(height: 15.h,),
                    Expanded(
                 
                      // height: 110.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(width: 5.w,),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context,index){
                        return   Column(
                          children: [
                            Container(
                    width: 76.w,
                    height: 76.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsClass.backgroundColorLight),
                      // color: Color(0xffd9d9d9),
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1617575521317-d2974f3b56d2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3Rvcnl8ZW58MHx8MHx8fDA%3D',),fit: BoxFit.cover)
                    
                    
                    ),
                    child: Icon(Icons.add,size: 50.sp,color: ColorsClass.textColor2,),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
"Dino",
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.w400,
color: ColorsClass.primaryColorLight
)
)
                          ],
                        );
                      }),
                    ),
CustomMainBottomSheet(
  height: 0.6.sh,
  child: Consumer<AuthProvider>(
        builder: (context ,val ,_) {
          return  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Text(
          "Recent Chat",
          style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          )
          ),
             Expanded(
               child: ListView.builder(
                itemCount: val.usersList.length,
                itemBuilder: (context,index){
                return UserTile(userModel: val.usersList[index],);
                       }),
             )
              ],
            ),
          )
          
                 ;
        }
      ),)



          
        ],
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({super.key, this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () async {
        final authProv = Provider.of<AuthProvider>(context, listen: false);
        final msgProv = Provider.of<MessageProvider>(context, listen: false);
        // MessageService messageService =MessageService();
        await msgProv.getRoomId(
            clinetModel: userModel!, myModel: authProv.userModel);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualChatPage(
                      userModel: userModel,
                    )));
      },
      // title: Text(userModel!.username ?? '',),

      leading: Container(
        width: 55,
height: 55,
decoration: BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.amberAccent
),
      ),
    title:  Text(
userModel!.username ?? '',
style: TextStyle(
fontSize: 18,
color: ColorsClass.primaryColorDark,
fontWeight: FontWeight.w500,
)
),
      // subtitle: Text(userModel!.email ?? ''),
      subtitle: Text(
userModel!.email ?? '',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.w300,
color: ColorsClass.primaryColorDark
)
),
    );
  }
}
