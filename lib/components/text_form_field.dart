import 'package:flutter/material.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;

  const PrimaryTextFormField(
      {super.key,
      this.controller,
      this.labelText,
      this.obscureText,
      this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
