import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputFormatter? formatter;
  final Function(String? value) onValidate;
  final IconData? icon;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.inputType,
    required this.onValidate,
    this.formatter,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        suffixIcon: (icon != null) ? Icon(icon) : null,
      ),
      keyboardType: inputType,
      inputFormatters: (formatter != null) ? [formatter!] : [],
      validator: (value) {
        return onValidate(value);
      },
    );
  }
}
