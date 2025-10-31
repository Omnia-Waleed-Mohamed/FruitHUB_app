import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await authRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginError(errorMessage: failure.errorMessage)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
