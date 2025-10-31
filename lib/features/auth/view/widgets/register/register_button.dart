
import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/auth/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterButton extends StatelessWidget {
  final String email;
  final String password;
  final String username;
  final String phone;

  const RegisterButton({
    super.key,
    required this.email,
    required this.password,
    required this.username,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: state is RegisterLoading
              ? null
              : () {
                  if (email.isEmpty || password.isEmpty || username.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all required fields'),
                      ),
                    );
                    return;
                  }

                  context.read<RegisterCubit>().createUserWithEmailAndPassword(
                        name: username,
                        email: email,
                        password: password,
                      );
                },
          child: const Text(
            "Create Account",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      },
    );
  }
}
