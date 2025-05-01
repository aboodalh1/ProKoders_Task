import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/navigate_function.dart';
import 'package:prokoders_login_task/core/widgets/custom_snack_bar.dart';
import 'package:prokoders_login_task/features/authentication/auth_gate.dart';
import 'package:prokoders_login_task/features/items/provider/items_provider.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key,required this.itemProvider});
  final ItemProvider itemProvider;
  @override
  Widget build(BuildContext context) {
    return IconButton(
              onPressed: (){
                try{ 
                itemProvider.signOut();
                navigateAndFinish(context, AuthGate());
                }catch(e){
                  customSnackBar(context, e.toString());
                }
              }, 
              icon: Icon(Icons.logout,color: Colors.white,size: 25.sp,));
  }
}