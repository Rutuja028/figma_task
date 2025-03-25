import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final String buttonText;
  const PrimaryButton({
    super.key,
    this.padding,
    this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color(0xFF006FFD),
        foregroundColor: Colors.white,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
