import 'dart:developer';

import 'package:e_commerce_app/core/errors/custom_exption.dart';
import 'package:e_commerce_app/core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices implements AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<User> createNewAccount({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      // log('error form creteuser$e');

      switch (e.code) {
        
        case 'email-already-in-use':
          errorMessage = 'This email is already registered.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled.';
          break;
        default:
          errorMessage = 'Registration failed. Please try again.';
      }

      throw CustomException(message: errorMessage);
    } catch (e) {
      //  log('error form creteuser$e');

      throw CustomException(
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  @override
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        default:
          errorMessage = 'Login failed. Please try again.';
      }

      throw CustomException(message: errorMessage);
    } catch (e) {
      throw CustomException(
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }
}
