import 'package:chatapp2/provider/auth_provider.dart';
import 'package:chatapp2/provider/message_provider.dart';
import 'package:chatapp2/provider/userProvider.dart';
import 'package:chatapp2/theme/theme.dart';
import 'package:chatapp2/utils/localStorage/localStorage.dart';


import 'package:chatapp2/views/auth/login.dart';
import 'package:chatapp2/views/auth/start_screen.dart';
import 'package:chatapp2/views/profile/profileScreen.dart';

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
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
   theme:CustomTheme.lightTheme,
  // themeMode: ThemeMode.dark,
      // darkTheme: CustomTheme.darkTheme,
          // home: const AuthScreen(),
          home: const StartScreen(),
          // home: ProfileScreen(),
        ),
      );

        }
    );
  }
}


