import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class UserModel {
//   final String name;
//   final String email;
//   final String password;

//   UserModel({
//     required this.name,
//     required this.email,
//     required this.password,
//   });

//   factory UserModel.fromFirebaseUser(User user) {
//     return UserModel(
//       name: user.displayName ?? "",
//       email: user.email ?? "",
//       password: user.uid, 
//     );
//   }

//   factory UserModel.fromEntity(UserEntity userEntity) {
//     return UserModel(
//       name: userEntity.name,
//       email: userEntity.email,
//       password: userEntity.id,
//     );
//   }

//   UserEntity toEntity() {
//     return UserEntity(
//       name: name,
//       email: email,
//       id: password,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "name": name,
//       "email": email,
//       "password": password,
//     };
//   }
// }


class UserModel {
  final String name;
  final String email;
  final String id; 

  UserModel({
    required this.name,
    required this.email,
    required this.id,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      id: user.uid, 
    );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      id: userEntity.id, 
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "id": id, 
    };
  }
}
