import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customSnackBar(context,String text,{Color? color}){
  ScaffoldMessenger. of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar( 
      content: Text(text, style: TextStyle(fontSize:14.sp),),
      showCloseIcon: true,
      backgroundColor: color??Colors.black,
      behavior: SnackBarBehavior.floating,
      padding:  EdgeInsetsDirectional.all(10.w),
      
    ),
  );
}