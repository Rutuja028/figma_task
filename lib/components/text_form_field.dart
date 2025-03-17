import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  // final String? labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  // final InputDecoration? decoration;
  final String? labelText;
  final String? prefixText;

  const PrimaryTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.labelText,
    this.obscureText,
    this.validator,
    this.suffixIcon,
    this.prefixText,
    this.inputFormatters,
    // this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixText: prefixText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF006FFD)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
