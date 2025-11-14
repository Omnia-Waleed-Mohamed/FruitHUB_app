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
import 'package:hive_flutter/adapters.dart';

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
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        id: user.uid,
      );
      await addUserData(userEntity: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      return left(FirebaseError(errorMassage: e.message));
    } catch (e) {
      log('error from createUser: $e');
      return left(FirebaseError(errorMassage: e.toString()));
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

      // UserModel userModel = UserModel.fromFirebaseUser(user);
      // return right(userModel.toEntity());
      final userDataResult = await getUserData(userId: user.uid);

      return userDataResult;
    } on CustomException catch (e) {
      return left(FirebaseError(errorMassage: e.message));
    } catch (e) {
      return left(FirebaseError(errorMassage: e.toString()));
    }
  }

  @override
  Future<void> addUserData({required UserEntity userEntity}) async {
    log('Starting to save user: ${userEntity.email} - ${userEntity.id}');
    try {
      await dataBaseService.addData(
        path: 'users',
        data: UserModel.fromEntity(userEntity).toMap(),
        dId: userEntity.id,
      );
      log(' User saved successfully to Firestore!');
    } catch (e) {
      log(' Error saving user to Firestore: $e');
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserData({
    required String userId,
  }) async {
    try {
      final userData = await dataBaseService.getData(
        path: 'users',
        dId: userId,
      );

      if (userData != null) {
        final userModel = UserModel.fromMap(userData);
        return right(userModel.toEntity());
      } else {
        return left(FirebaseError(errorMassage: 'User data not found'));
      }
    } catch (e) {
      return left(FirebaseError(errorMassage: e.toString()));
    }
  }

  @override
  Future saveUserEntity({required UserEntity userEntity}) async {
    final userBox = Hive.box<UserEntity>("user");
    await userBox.put("user", userEntity);
  }
}
