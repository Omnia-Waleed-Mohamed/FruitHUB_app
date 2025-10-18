import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
 
 Future<User> createNewAccount({required String email, required String password});
 
 
}
