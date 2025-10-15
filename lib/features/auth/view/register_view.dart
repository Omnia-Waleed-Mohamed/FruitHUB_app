import 'package:e_commerce_app/core/widgets/text_form_field.dart';

import 'package:e_commerce_app/features/auth/view/widgets/register/first_text_register.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/or_sign_up.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/register_body.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/register_button.dart';

import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RegisterBody(),
    );
  }
}
