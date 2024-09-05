import 'package:ams/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColorWhite),
          ),
          fillColor: AppColors.backgroundColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.headingTextColor)),
    );
  }
}
