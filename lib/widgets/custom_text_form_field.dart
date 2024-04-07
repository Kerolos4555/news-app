import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final Function(String) onChange;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      onChanged: onChange,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
