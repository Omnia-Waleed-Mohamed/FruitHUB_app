import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';
import 'package:hive_flutter/adapters.dart';

UserEntity getUserData() {
  final userBox = Hive.box<UserEntity>("users");
  return userBox.get("user")!;
}