import 'package:flutter/material.dart';
import 'package:mvvm_flutter/res/colors.dart';
class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({super.key,required this.title,this.loading=false,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration (
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),

        ),
        child: Center(child:loading? const CircularProgressIndicator(color: AppColors.backgroundColor,):Text(title,style: const TextStyle(fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
