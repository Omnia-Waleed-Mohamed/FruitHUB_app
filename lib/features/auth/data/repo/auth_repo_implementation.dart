import 'package:e_commerce_app/core/services/auth_services.dart';
import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplementation extends AuthRepo {
  AuthRepoImplementation({required this.authServices});

  AuthServices authServices;

  @override
  Future<UserEntity> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    User user = await authServices.createNewAccount(email: email,password: password);
 
   UserModel userModel =UserModel.fromfirebaseuser(user);


   UserEntity userEntity = userModel.toEntity();

   return userEntity;

  }
}
