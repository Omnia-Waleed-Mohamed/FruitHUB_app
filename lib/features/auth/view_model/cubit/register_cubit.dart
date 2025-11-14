import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    
    var result = await authRepo.createUserWithEmailAndPassword(
      name: name, 
      email: email,
      password: password,
    );

    result.fold(
      (l) => emit(RegisterError(errorMessage: l.errorMassage)),
      (r) => emit(RegisterSuccess(userEntity: r)),
    );
  }
}
