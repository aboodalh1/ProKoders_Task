import 'package:flutter/material.dart';
import 'package:prokoders_login_task/features/authentication/view/register/register_page.dart';

import 'view/login/login_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage  = true;
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showLoginPage? LoginPage(onTap:togglePages) : RegisterScreen(onTap:togglePages);
  }
}
