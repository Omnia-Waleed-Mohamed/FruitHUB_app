
import 'package:e_commerce_app/core/widgets/text_form_field.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/first_text_login.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/forget_password.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/login_button.dart';
import 'package:e_commerce_app/features/auth/view/widgets/login/or_sign_in.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FirstTextLogin(),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Email",
            icon: Icons.email,
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Password",
            icon: Icons.visibility,
            isPassword: true,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          const SizedBox(height: 10),
          ForgetPassword(),
          const SizedBox(height: 20),
          LoginButton(
            email: email,
            password: password,
          ),
          const SizedBox(height: 20),
          OrSignIn(),
        ],
      ),
    );
  }
}
