import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/widgets/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.onTap, required this.error});

  final VoidCallback onTap;
  final String error;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(error,style: TextStyle(fontSize: 13.sp),)),
        CustomButton(onTap: onTap),
      ],
    );
  }
}
