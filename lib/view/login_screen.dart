import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';

import '../utils/utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: (){
          Utils.flushBarErrorMessage('No internet Connection', context);
          // Utils.toastMessage('Hello Flutter');

          // Navigator.pushNamed(context, RoutesName.home);
        },
          child: Text('Click')))
    );
  }
}
