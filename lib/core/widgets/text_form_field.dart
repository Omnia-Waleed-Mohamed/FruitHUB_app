
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/const/colors/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged; 

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.onChanged, 
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged, 
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColor.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : Icon(widget.icon, color: AppColor.iconColor),
        labelText: widget.label,
        labelStyle: const TextStyle(color: AppColor.iconColor),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColor.iconColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColor.kPrimaryColor),
        ),
      ),
    );
  }
}

