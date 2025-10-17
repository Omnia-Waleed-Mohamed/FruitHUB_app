import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';

abstract class AuthRepo {
  
  Future<UserEntity> createUserWithEmailAndPassword({required String email, required String password});
}