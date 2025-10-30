import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/auth/view_model/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  //const RegisterButton({super.key});

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.kPrimaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () async {
        if (email.isEmpty || password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter email and password')),
          );
          return;
        }

        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        } catch (e) {
          print('Error: $e');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
        }
      },

      child: Text(
        "Create Account",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
