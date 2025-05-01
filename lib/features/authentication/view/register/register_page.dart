import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/navigate_function.dart';
import 'package:prokoders_login_task/core/widgets/custom_snack_bar.dart';
import 'package:prokoders_login_task/core/widgets/my_button.dart';
import 'package:prokoders_login_task/core/widgets/my_text_field.dart';
import 'package:prokoders_login_task/features/authentication/provider/auth_provider.dart';
import 'package:prokoders_login_task/features/authentication/view/widgets/authentication_header.dart';
import 'package:prokoders_login_task/features/authentication/view/widgets/toggle_row.dart';
import 'package:prokoders_login_task/features/items/view/home_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;

  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      customSnackBar(context, "Passwords do not match");
      return;
    }
    final authService = Provider.of<AuthProvider>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
      if (!mounted) return;
      navigateAndFinish(context, HomeScreen());
    } catch (e) {
      if (!mounted) return;
      customSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthenticationHeader(text: 'Let\'s create an account for you!',),
                    SizedBox(height: 25.h),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obsecureText: false,
                    ),
                    SizedBox(height: 10.h), 
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obsecureText: true,
                    ),
                    SizedBox(height: 10.h),
                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm your password',
                      obsecureText: true,
                    ),
                    SizedBox(height: 25.h),
                    isLoading
                        ? LinearProgressIndicator(color: Colors.black)
                        : MyButton(onTap: signUp, text: 'Sign up'),
                    SizedBox(height: 50.h),
                    ToggleRow(buttonText: 'Login now',text: 'Already a member?',onTap: widget.onTap!,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

