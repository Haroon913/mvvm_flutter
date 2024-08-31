import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
   static toastMessage(String message){
     Fluttertoast.showToast(msg: message);
   }
   static void flushBarErrorMessage(String message,BuildContext context){
     showFlushbar(context: context,
         flushbar: Flushbar(message: message,
           backgroundColor: Colors.red,
           title: 'Error',messageColor: Colors.white,
           forwardAnimationCurve: Curves.decelerate,
           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
           padding: EdgeInsets.all(15),
           reverseAnimationCurve: Curves.easeInOut,
           icon: Icon(Icons.error,size: 25,color: Colors.white,),
           flushbarPosition: FlushbarPosition.TOP,
           borderRadius: BorderRadius.circular(15),
           duration: Duration(seconds: 2),)..show(context),
     );
   }
   static snakBar(String message,BuildContext context){
     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Text(message),
       backgroundColor: Colors.teal,
     ));
   }
}