import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:flutter/material.dart';

class FirstTextLogin extends StatelessWidget {
  const FirstTextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimaryColor,
              ),
            ),
            const Text(
              "we're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
          ])
    
    ;
  }
}