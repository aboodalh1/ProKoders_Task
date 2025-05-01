import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/widgets/my_button.dart';
import 'package:prokoders_login_task/core/widgets/my_text_field.dart';
import 'package:prokoders_login_task/features/authentication/provider/auth_provider.dart';
import 'package:prokoders_login_task/features/authentication/view/widgets/authentication_header.dart';
import 'package:prokoders_login_task/features/authentication/view/widgets/custom_text_button.dart';
import 'package:prokoders_login_task/features/authentication/view/widgets/toggle_row.dart';
import 'package:provider/provider.dart';
 
class LoginBody extends StatelessWidget {
  final emailController;
  final passwordController;
  final Function onTap;
  final Function() login;
  const LoginBody({
    super.key,
    this.emailController,
    this.passwordController,
    required this.onTap,
    required this.login,
  });
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.0.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthenticationHeader(text: 'Welcome back you\'ve been missed'),
                SizedBox(height: 25.h),
                MyTextField(
                  isEmail: true,
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false,
                ),
                SizedBox(height: 20.h),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: provider.loginIsPasswordShown,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text:
                          provider.loginIsPasswordShown
                              ? Text("Show password")
                              : Text("Hide password"), 
                      onPressed: () {
                        provider.showHidePassword(isRegister: false);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                provider.isLoading
                    ? LinearProgressIndicator(color: Colors.black)
                    : MyButton(onTap: login, text: 'Sign In'),
                SizedBox(height: 50.h),
                ToggleRow(
                  text: 'Not a member?',
                  buttonText: 'Register now',
                  onTap: onTap(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
