import 'dart:io';

import 'package:chatapp2/services/api_response_helperclass.dart';
import 'package:chatapp2/services/auth/auth_services.dart';
import 'package:chatapp2/utils/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class UserServices{
 Dio dio =Dio();

  Future login({required String email ,required String username,required BuildContext context})async{

 try {
 var response = await  dio.post(baseURl+"api/auth/login",
 data: {
    "username":username,
    "email":email,
    "password":"123"
 }
 
   );

  switch (response.statusCode){
    case 200:
    default:

    // ignore: use_build_context_synchronously
    CustomSnackBar.buildErrorSnackbar(context, response.data.toString());

          throw Exception(response.data);

  }
   } on SocketException {
    Provider.of<AuthProvider>(context, listen: false).isLoading=false;
      CustomSnackBar.buildErrorSnackbar(context, 'NO Internet');
      throw NoInternetException('No Internet');
    } on HttpException {
      Provider.of<AuthProvider>(context, listen: false).isLoading=false;
      CustomSnackBar.buildErrorSnackbar(context, 'No Service Found');
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      Provider.of<AuthProvider>(context, listen: false).isLoading=false;
      CustomSnackBar.buildErrorSnackbar(context, 'Invalid Data Format');
      throw InvalidFormatException('Invalid Data Format');
    }
 catch (e) {
  Provider.of<AuthProvider>(context, listen: false).isLoading=false;
   CustomSnackBar.buildErrorSnackbar(context, e.toString());
      throw UnknownException(e.toString());
 }




}
}