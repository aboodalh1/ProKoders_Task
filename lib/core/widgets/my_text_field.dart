import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final bool ? isEmail;

  const MyTextField({super.key,this.isEmail,required this.controller,required this.hintText, required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isEmail!=null && isEmail==true?TextInputType.emailAddress:null,
      obscureText: obsecureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
  
        ),
          fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey
        )
      ),
    );
  }
}
