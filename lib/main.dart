import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/provider/message_provider.dart';
import 'package:chatapp2/provider/socketProvider.dart';
import 'package:chatapp2/provider/userProvider.dart';
import 'package:chatapp2/theme/theme.dart';
import 'package:chatapp2/utils/localStorage/localStorage.dart';


import 'package:chatapp2/views/auth/login.dart';
import 'package:chatapp2/views/auth/start_screen.dart';
import 'package:chatapp2/views/chat/mainscreen.dart';
import 'package:chatapp2/views/profile/profileScreen.dart';
import 'package:chatapp2/views/splash/splashScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
 await SharedPreferencesService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
    return MultiProvider(
        providers: [
      
         ChangeNotifierProvider<MessageProvider>(
                  create: (_) => MessageProvider()),
                        ChangeNotifierProvider<AuthProvider>(
                  create: (_) => AuthProvider()),


                            ChangeNotifierProvider<UserController>(
                  create: (_) => UserController()),

                       ChangeNotifierProvider<SocketProvider>(
                  create: (_) => SocketProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
   theme:CustomTheme.lightTheme,
routes: {
       '/': (context) => SplashScreen(),
        '/mainScreen': (context) => MainScreen(),
        '/startScreen': (context) => StartScreen(),
 
},

  // themeMode: ThemeMode.dark,
      // darkTheme: CustomTheme.darkTheme,
          // home: const AuthScreen(),
          initialRoute:  '/' , 
          // home: (SharedPreferencesService.getAuthToken  !=null &&SharedPreferencesService.getAuthToken  !='' ) ?
          // SplashScreen():
          //  StartScreen() ,
          // home: ProfileScreen(),
        ),
      );

        }
    );
  }
}


