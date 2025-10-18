class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class FirebaseError extends Failure {
 FirebaseError({required String errorMessage})
      : super(errorMessage: errorMessage);
}
