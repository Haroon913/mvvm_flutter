
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter/view_model/usre_view_model.dart';

import '../../model/user_model.dart';
import '../../utils/routes/routes_name.dart';

class SplashServices{
  Future<UserModel> getUserData()=>UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async{
    getUserData().then((value){
      print(value.token.toString());

      if(value.token==null||value.token==''){
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }
      else{
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error,stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }
}