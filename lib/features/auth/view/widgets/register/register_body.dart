import 'package:e_commerce_app/core/widgets/text_form_field.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/first_text_register.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/or_sign_up.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/register_button.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String email = "";
  String password = "";
  String username = "";
  String phone = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FirstTextRegister(),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Username",
            icon: Icons.person,
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Email",
            icon: Icons.email,
            onChanged: (value) {
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
          const SizedBox(height: 20),
          CustomTextField(
            label: "Phone Number",
            icon: Icons.phone,
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          const SizedBox(height: 20),
          RegisterButton(
            email: email,
            password: password,
            username: username,
            phone: phone,
          ),
          const SizedBox(height: 20),
          const OrSignUp(),
        ],
      ),
    );
  }
}
