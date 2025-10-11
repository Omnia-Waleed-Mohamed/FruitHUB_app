import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  color: AppColor.kPrimaryColor,
                ),
              ),
            )
    ;
  }
}