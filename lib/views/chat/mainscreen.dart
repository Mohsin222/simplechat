import 'package:chatapp2/model/user_model.dart';
import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/views/chat/individual_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

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
    
    return  Scaffold(
      appBar: AppBar(
        title: Consumer<AuthProvider>(
        builder: (context ,val ,_) {
          return  Text(val.userModel.email.toString());
        }
      ),

      
      ),

      body: Consumer<AuthProvider>(
        builder: (context ,val ,_) {
          return ListView.builder(
            itemCount: val.usersList.length,
            itemBuilder: (context,index){
            return UserTile(userModel: val.usersList[index],);
          });
        }
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({super.key, this.userModel});
final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> IndividualChatPage(userModel: userModel,)));
      },
      title: Text(userModel!.username ?? ''),
            subtitle: Text(userModel!.email ?? ''),
    );
  }
}