
import 'package:e_commerce_app/core/services/firebase_auth_services.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getItSetup() {
 getIt.registerSingleton<AuthRepo>(
  AuthRepoImplementation(authServices: FirebaseAuthServices()),
);
}
