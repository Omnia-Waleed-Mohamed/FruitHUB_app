import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';

abstract class AuthRepo {
  
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String email, required String password});
}