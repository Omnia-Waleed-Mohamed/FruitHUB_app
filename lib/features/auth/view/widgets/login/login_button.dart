
import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/view_model/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginButton extends StatelessWidget {
  final String email;
  final String password;

  const LoginButton({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final authRepo = GetIt.I<AuthRepo>();

    return BlocProvider(
      create: (_) => LoginCubit(authRepo: authRepo),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful!')),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeView()),
            );
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.kPrimaryColor),
            );
          }

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.kPrimaryColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (email.isEmpty || password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter email and password')),
                );
                return;
              }

              context
                  .read<LoginCubit>()
                  .loginWithEmailAndPassword(email: email, password: password);
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
