import 'package:flutter/material.dart';
import 'package:task/core/constants/appColors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Icon ?prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.prefixIcon ,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Appcolors.spice,
      controller: controller,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Appcolors.classic),
        focusedBorder: UnderlineInputBorder(),
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      textInputAction: textInputAction,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}