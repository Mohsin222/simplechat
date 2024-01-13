


import 'package:flutter/material.dart';

class SnackBarClass{

   static   snackbar(String? text){
return    SnackBar(
  backgroundColor: Colors.purple,
      
              content: Text(text!),
              duration: Duration(seconds: 3),
              action: SnackBarAction(
              textColor: Colors.red,
                label: '',
                onPressed: () {
                  // Perform some action when the "Undo" button is pressed
                  // (optional)
                },
              ),
            );
   }
}

