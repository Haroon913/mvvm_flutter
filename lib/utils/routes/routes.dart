import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_flutter/view/home_screen.dart';
import 'package:mvvm_flutter/view/login_view.dart';
import 'package:mvvm_flutter/view/signup_view.dart';
import 'package:mvvm_flutter/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context)=>const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context)=>const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=>const SignupView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(child: Text('No route defined'),),
          );
        });
    }
  }
}