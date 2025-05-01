import 'package:flutter/material.dart';
import 'package:prokoders_login_task/core/util/navigate_function.dart';
import 'package:prokoders_login_task/core/widgets/custom_snack_bar.dart';
import 'package:prokoders_login_task/features/authentication/provider/auth_provider.dart';
import 'package:prokoders_login_task/features/authentication/view/login/login_body.dart';
import 'package:prokoders_login_task/features/items/view/home_screen.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  

  void signIn() async {
  
    final authService = Provider.of<AuthProvider>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: LoginBody(
          onTap: ()=>widget.onTap,
          emailController: emailController,
          passwordController: passwordController,
          login: () => signIn(), 
        )),
    );
  }
}