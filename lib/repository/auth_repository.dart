import 'package:mvvm_flutter/data/network/BaseApiServices.dart';
import 'package:mvvm_flutter/data/network/NetworkApiService.dart';
import 'package:mvvm_flutter/res/app_urls.dart';

class AuthRepository{
  BaseApiServices _apiServices=NetworkApiService();
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> signUpApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}