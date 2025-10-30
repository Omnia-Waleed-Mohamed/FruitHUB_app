import 'package:e_commerce_app/core/widgets/text_form_field.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/first_text_login.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/forget_password.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/login_button.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/or_sign_in.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FirstTextLogin(),

            const SizedBox(height: 20),

            CustomTextField(label: "Email", icon: Icons.email,
            onChanged: (value){},),
            SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              icon: Icons.visibility,
              isPassword: true,
              onChanged: (value){},
            ),
            SizedBox(height: 10),
            ForgetPassword(),

            SizedBox(height: 20),

            LoginButton(),

            SizedBox(height: 20),
            OrSignIn(),
          ],
        ),
      );
  }
}