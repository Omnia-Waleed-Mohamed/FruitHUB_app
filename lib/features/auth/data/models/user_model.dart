import 'package:e_commerce_app/features/auth/data/entitys/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name; 
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });


   factory UserModel.fromfirebaseuser(User user) {
     return UserModel(
       name: user.displayName ?? " ",
       email: user.email ?? " ",
       password: user.uid  ?? " ",
     );
     
   }

  

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      password: password,
    );
  }
    

}
