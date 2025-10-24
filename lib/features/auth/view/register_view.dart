import 'package:e_commerce_app/core/services/getit.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/register_body.dart';
import 'package:e_commerce_app/features/auth/view_model/cubit/register_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),

      child: Scaffold(resizeToAvoidBottomInset: false, body: RegisterBody()),
    );
  }
}
