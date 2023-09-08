enum FirebaseAuthExceptions {
  EMAIL_ALREADY_IN_USE('email-already-in-use'),
  INVALID_EMAIL('invalid-email'),
  USER_NOT_FOUND('user-not-found'),
  WRONG_PASSWORD('wrong-password');

  final String value;
  const FirebaseAuthExceptions(this.value);
}