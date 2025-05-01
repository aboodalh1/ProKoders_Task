import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/styles.dart';

class MyButton extends StatelessWidget {
  final void Function() ? onTap;
  final String text;
  const MyButton({super.key ,required this.onTap , required this.text });
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.all(25.w),
        decoration: BoxDecoration(
          color:Colors.black,
          borderRadius: BorderRadius.circular(9.r)
        ), 
        child: Center(
          child:Text(text, style: AppStyles.allertaStencilSemiBold15(context).copyWith(
            color: Colors.white
          ))
        ),
      ),
    );
  }
}
