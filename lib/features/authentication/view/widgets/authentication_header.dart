import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/styles.dart';

class AuthenticationHeader extends StatelessWidget {
  const AuthenticationHeader({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            text,
            style: AppStyles.allertaStencilSemiBold25(context),
          ),
        ),
        SizedBox(height: 50.h),
        Icon(
          Icons.shopping_cart_outlined,
          size: 100.sp,
          color: Colors.grey[800],
        ),
      ],
    );
  }
}
