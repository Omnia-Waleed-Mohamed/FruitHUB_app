import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:flutter/material.dart';

class FirstTextRegister extends StatelessWidget {
  const FirstTextRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimaryColor,
              ),
            ),
            const Text(
              "Sign up now and start exploring all that our app has to offer. we're excited to welcome you to our community!",
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
      ],
    );
  }
}

