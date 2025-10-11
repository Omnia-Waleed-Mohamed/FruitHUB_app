import 'package:e_commerce_app/core/widgets/text_form_field.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/first_text_register.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/or_sign_up.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/register_button.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FirstTextRegister(),
            const SizedBox(height: 20),
            CustomTextField(label: "Username", icon: Icons.person),
            SizedBox(height: 20),
            CustomTextField(label: "Email", icon: Icons.email),
            SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              icon: Icons.visibility,
              isPassword: true,
            ),
            SizedBox(height: 20),
            CustomTextField(label: "Phone Nunber", icon: Icons.phone),
            SizedBox(height: 20),
            RegisterButton(),

            SizedBox(height: 20),
          
            OrSignUp(),
          ],
        ),
      )
    
    ;
  }
}