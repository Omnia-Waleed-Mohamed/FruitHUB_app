import 'package:e_commerce_app/core/help/snackbar.dart';
import 'package:e_commerce_app/core/services/getit.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/view/widgets/register/register_body.dart';
import 'package:e_commerce_app/features/auth/view_model/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              showsnackbar(context, 'Register Success');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeView()),
              );
            } else if (state is RegisterError) {
              showsnackbar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is RegisterLoading,
              child: const RegisterBody(),
            );
          },
        ),
      ),
    );
  }
}
