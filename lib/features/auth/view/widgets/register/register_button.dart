// import 'package:e_commerce_app/core/const/colors/colors.dart';
// import 'package:e_commerce_app/features/auth/view_model/cubit/register_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RegisterButton extends StatelessWidget {
  

//   final String email;
//   final String password;
//   final String username;
//   final String phone;

//   const RegisterButton({
//     super.key,
//     required this.email,
//     required this.password,
//     required this.username,
//     required this.phone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColor.kPrimaryColor,
//         minimumSize: const Size(double.infinity, 50),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//       onPressed: ()  {

//         if (email.isEmpty || password.isEmpty) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Please enter email and password')),
//                 );
//                 return;
//               }
//         context.read<RegisterCubit>().createUserWithEmailAndPassword(
//           name: username,
//           email: email,
//           password: password,
//         );
//       },

//       child: Text(
//         "Create Account",
//         style: TextStyle(color: Colors.white, fontSize: 16),
//       ),
//     );
//   }
// }




import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/auth/view_model/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        } else if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: state is RegisterLoading
              ? null
              : () {
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter email and password')),
                    );
                    return;
                  }

                  context.read<RegisterCubit>().createUserWithEmailAndPassword(
                        name: username,
                        email: email,
                        password: password,
                      );
                },
          child: state is RegisterLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
        );
      },
    );
  }
}
