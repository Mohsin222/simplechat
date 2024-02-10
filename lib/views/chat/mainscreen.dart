import 'package:chatapp2/constants/colors.dart';
import 'package:chatapp2/constants/text_file.dart';
import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/provider/message_provider.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:chatapp2/views/auth/start_screen.dart';
import 'package:chatapp2/views/chat/individual_chat_page.dart';
import 'package:chatapp2/views/chat/widget/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../services/message_services/message_service.dart';
import '../../services/socket/socketClass.dart';
import '../../utils/localStorage/localStorage.dart';
import '../auth/widget/auth_bottom_sheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
   SocketService _socketService = SocketService();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
//       WidgetsBinding.instance.addPostFrameCallback((_){
// Provider.of<AuthProvider>(context, listen: false).allUsers();
//   });

    // _socketService.connect(context);
  }
  @override
  void dispose() {
    // _socketService.disconnect();
    super.dispose();
  }
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
      // backgroundColor: ColorsClass.backgroundColorDark,
      appBar: AppBar(
        toolbarHeight: 100.h,
        // backgroundColor: ColorsClass.backgroundColorDark,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
            Consumer<AuthProvider>(builder: (context, val, _) {
              return Text(val.userModel.email.toString());
            })
          ],
        ),
        actions: [
          IconButton(onPressed: ()async {

            //  AuthServices authServices =AuthServices();
          // await   authServices.getMyAllChats( context: context);

   await       SharedPreferencesService.clearAllData().then((value) {
    Navigator.popUntil(context,ModalRoute.withName('/'));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartScreen(),));
   });
          }, icon: Icon(Icons.logout))
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

body :NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              
                     SliverAppBar(
                      automaticallyImplyLeading: false,
                    toolbarHeight:    160.h,
                       flexibleSpace: Container(
                                 height: 160.h,
                                 child: ListView.separated(
                                     separatorBuilder: (context, index) => SizedBox(
                        width: 5.w,
                                         ),
                                     scrollDirection: Axis.horizontal,
                                     itemCount: 10,
                                     itemBuilder: (context, index) {
                                       return Column(
                                         children: [
                        Container(
                          width: 76.w,
                          height: 76.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorsClass.backgroundColorLight),
                              // color: Color(0xffd9d9d9),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1617575521317-d2974f3b56d2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3Rvcnl8ZW58MHx8MHx8fDA%3D',
                                  ),
                                  fit: BoxFit.cover)),
                          child: Icon(
                            Icons.add,
                            size: 50.sp,
                            color: ColorsClass.textColor2,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("Dino",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                     // color: ColorsClass.primaryTextColorLight
                            ))
                                         ],
                                       );
                                     }),
                               ),
                     ),
            ];
          },
          body: Consumer<AuthProvider>(builder: (context, val, _) {
                    return Container(
                             decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius:const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
                        //  color: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                      child: Column(
                
                        crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
              
                        children: [
                          Text(ConstantTexts.chatHeading,
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(   fontWeight: FontWeight.w600,color: Colors.red),),
                  
                    SizedBox(height: 15.h,),
                    
                          Expanded(
                            child: ListView.builder(
              // controller: scrollController,
                                // physics: NeverScrollableScrollPhysics(),
              
                                shrinkWrap: true,
                                cacheExtent: 100.h,
                                itemCount: val.roomsList.length,
                                itemBuilder: (context, index) {
                                  return UserTile(
                                    
                                    userModel: val.userModel.sId == val.roomsList[index].users!.first.sId ? val.roomsList[index].users![1]:val.roomsList[index].users![0],
                                    onPress: () async {
                                      final authProv = Provider.of<AuthProvider>(
                                          context,
                                          listen: false);
              
                                      final msgProv = Provider.of<MessageProvider>(
                                          context,
                                          listen: false);
              
                                      // MessageService messageService =MessageService();
              
                                      await msgProv.getRoomId(
                                          clinetModel: val.userModel.sId == val.roomsList[index].users!.first.sId ? val.roomsList[index].users![1]:val.roomsList[index].users![0],
                                          myModel: authProv.userModel);
              
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  IndividualChatPage(
                                                    // userModel: val.usersList[index],
                                                    userModel:  val.userModel.sId == val.roomsList[index].users!.first.sId ? val.roomsList[index].users![1]:val.roomsList[index].users![0],

                                                    // mySocket: _socketService.socket!,
                                                )));
                                    },
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  }),
)
      
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Story",
//                     style: TextStyle(
//                         fontSize: 22.829790115356445,
//                         fontWeight: FontWeight.w400,
//                         color: ColorsClass.primaryTextColorLight)),
//                 Text("See All",
//                     style: TextStyle(
//                       color: ColorsClass.textColor2,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w400,
//                     )),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           Container(
//             height: 160.h,
//             child: ListView.separated(
//                 separatorBuilder: (context, index) => SizedBox(
//                       width: 5.w,
//                     ),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       Container(
//                         width: 76.w,
//                         height: 76.h,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: ColorsClass.backgroundColorLight),
//                             // color: Color(0xffd9d9d9),
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                   'https://images.unsplash.com/photo-1617575521317-d2974f3b56d2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3Rvcnl8ZW58MHx8MHx8fDA%3D',
//                                 ),
//                                 fit: BoxFit.cover)),
//                         child: Icon(
//                           Icons.add,
//                           size: 50.sp,
//                           color: ColorsClass.textColor2,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Text("Dino",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
// // color: ColorsClass.primaryTextColorLight
//                           ))
//                     ],
//                   );
//                 }),
//           ),
//           Expanded(
// child: MyHomePage(),
            
//             // child: CustomMainBottomSheet(
//             //   height: 0.6.sh,

//             //   // child: Text('aaaaaaaaaaaaaaaa'),

//             //   child: Consumer<AuthProvider>(builder: (context, val, _) {
//             //     return Container(
//             //         //  color: Colors.black,
//             //       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
//             //       child: Column(
//             //         crossAxisAlignment: CrossAxisAlignment.start,

//             //         // mainAxisSize: MainAxisSize.min,

//             //         children: [
//             //           Text(ConstantTexts.chatHeading,
//             //               style: Theme.of(context).textTheme.headlineSmall!.copyWith(   fontWeight: FontWeight.w600,),),
//             //           Expanded(
//             //             child: ListView.builder(

//             //                 // physics: NeverScrollableScrollPhysics(),

//             //                 shrinkWrap: true,
//             //                 cacheExtent: 100.h,
//             //                 itemCount: val.usersList.length,
//             //                 itemBuilder: (context, index) {
//             //                   return UserTile(
//             //                     userModel: val.usersList[index],
//             //                     onPress: () async {
//             //                       final authProv = Provider.of<AuthProvider>(
//             //                           context,
//             //                           listen: false);

//             //                       final msgProv = Provider.of<MessageProvider>(
//             //                           context,
//             //                           listen: false);

//             //                       // MessageService messageService =MessageService();

//             //                       await msgProv.getRoomId(
//             //                           clinetModel: val.usersList[index],
//             //                           myModel: authProv.userModel);

//             //                       Navigator.push(
//             //                           context,
//             //                           MaterialPageRoute(
//             //                               builder: (context) =>
//             //                                   IndividualChatPage(
//             //                                     userModel: val.usersList[index],
//             //                                   )));
//             //                     },
//             //                   );
//             //                 }),
//             //           )
//             //         ],
//             //       ),
//             //     );
//             //   }),
//             // ),
//           )
//         ],
//       ),
    );
  }
}
// class MyHomePage extends StatelessWidget {
//   // final _controller = DraggableScrollableController();
//   //   final _sheet = GlobalKey();
//   //  ScrollController _scrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//         color: Colors.blueGrey[100],
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       child: DraggableScrollableSheet(
// // key: _sheet,
//     snapAnimationDuration: Duration(seconds: 2),
//         expand: false,
     
//   // snapSizes: [
//   //       60 / 1.sh,
//   //       0.5,
//   //     ],
//         initialChildSize: 0.90, // initial size of the sheet (as a fraction of screen height)
//          minChildSize: 0.90, // minimum size of the sheet when fully collapsed
//         maxChildSize:1, // maximum size of the sheet when fully expanded
//         builder: (BuildContext context, ScrollController scrollController) {
//           return    MediaQuery.removePadding(
//             removeTop: true,
//             context: context,
            
//             child: Consumer<AuthProvider>(builder: (context, val, _) {
//                     return Container(
//                         //  color: Colors.black,
//                       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
//                       child: Column(
                
//                         crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
              
//                         children: [
//                           Text(ConstantTexts.chatHeading,
//                               style: Theme.of(context).textTheme.headlineSmall!.copyWith(   fontWeight: FontWeight.w600,color: Colors.red),),
//                           Expanded(
//                             child: ListView.builder(
//               controller: scrollController,
//                                 // physics: NeverScrollableScrollPhysics(),
              
//                                 shrinkWrap: true,
//                                 cacheExtent: 100.h,
//                                 itemCount: val.usersList.length,
//                                 itemBuilder: (context, index) {
//                                   return UserTile(
                                    
//                                     userModel: val.usersList[index],
//                                     onPress: () async {
//                                       final authProv = Provider.of<AuthProvider>(
//                                           context,
//                                           listen: false);
              
//                                       final msgProv = Provider.of<MessageProvider>(
//                                           context,
//                                           listen: false);
              
//                                       // MessageService messageService =MessageService();
              
//                                       await msgProv.getRoomId(
//                                           clinetModel: val.usersList[index],
//                                           myModel: authProv.userModel);
              
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   IndividualChatPage(
//                                                     userModel: val.usersList[index],
//                                                   )));
//                                     },
//                                   );
//                                 }),
//                           )
//                         ],
//                       ),
//                     );
//                   }),
//           );
//         },
//       ),
//     );
//   }
// }