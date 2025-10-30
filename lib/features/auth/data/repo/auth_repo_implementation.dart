import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/custom_exption.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/services/auth_services.dart';
import 'package:e_commerce_app/core/services/data_base_service.dart';
import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplementation extends AuthRepo {
  AuthRepoImplementation({
    required this.authServices,
    required this.dataBaseService,
  });

  final AuthServices authServices;
  final DataBaseService dataBaseService;

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      
      User user = await authServices.createNewAccount(
        email: email,
        password: password,
      );

      
      UserModel userModel = UserModel(
        name: name,
        email: email,
        password: user.uid,
      );

      
      await addUserData(userEntity: userModel.toEntity());

      return right(userModel.toEntity());
    } on CustomException catch (e) {
      return left(FirebaseError(errorMessage: e.message));
    } catch (e) {
      log('error from createUser: $e');
      return left(FirebaseError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await authServices.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel.fromFirebaseUser(user);
      return right(userModel.toEntity());
    } on CustomException catch (e) {
      return left(FirebaseError(errorMessage: e.message));
    } catch (e) {
      return left(FirebaseError(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> addUserData({required UserEntity userEntity}) async {
    await dataBaseService.addData(
      path: 'users',
      data: UserModel.fromEntity(userEntity).toMap(),
    );
  }
}
