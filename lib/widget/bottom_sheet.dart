import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomSheetWidget extends StatelessWidget {
   BottomSheetWidget({super.key, required this.onpress});

 final  VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return 
    Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading:  Icon(Icons.photo),
            title:  Text('Photo'),
            onTap: onpress
          ),
      
    
        ],
      );
    
  }
}