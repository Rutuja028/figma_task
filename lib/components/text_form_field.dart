import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? prefixText;

  const PrimaryTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.obscureText,
    this.validator,
    this.suffixIcon,
    this.prefixText,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? true,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixText: prefixText,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFFC5C6CC),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFFC5C6CC)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF006FFD)),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
