import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/res/colors.dart';
import 'package:mvvm_flutter/res/components/round_button.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_flutter/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword=ValueNotifier<bool>(true);
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obsecurePassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    final width=MediaQuery.of(context).size.width*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login MVVM',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value){
                  Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                },
                decoration: const InputDecoration(
                  hintText: 'email',
                 labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),

              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context,value,child){
                    return  TextFormField(
                      controller: passwordController,
                      obscuringCharacter: '*',
                      obscureText: _obsecurePassword.value,
                      focusNode: passwordFocusNode,
                      decoration:InputDecoration(
                        hintText: 'password',
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value =!_obsecurePassword.value;
                          },
                            child: Icon( _obsecurePassword.value? Icons.visibility_off:Icons.visibility)),
                      ),
                    );
                  }),
              SizedBox(height: height*.1,),
              RoundButton(title: 'Login',
                  loading: authViewModel.loading,
                  onPress: (){
                if(emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please enter email', context);
                }else if (passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please enter password', context);

                }else if(passwordController.text.length<6){
                  Utils.flushBarErrorMessage('Password should be at-least 6 characters', context);
                }else{
                  Map data={
                    'email':emailController.text.toString(),
                    'password':passwordController.text.toString(),

                  };
                  authViewModel.loginApi(data, context);
                }
              }),
              SizedBox(height: height*.03,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.signup);
                },
                  child: const Text('Dont have an account? SignUp')),




            ],
          ),
        ),
      )
    );
  }
}
