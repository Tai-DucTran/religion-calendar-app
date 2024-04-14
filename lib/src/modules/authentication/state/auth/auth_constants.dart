import 'package:flutter/foundation.dart' show immutable;

@immutable
class AuthConstants {
  static const accountExistsWithDifferentCredential =
      'account-exists-with-differen-credential';
  static const emailAlreadyInUse = 'email-already-in-use';
  static const googleCom = 'google.com';
  static const emailScope = 'email';

  const AuthConstants._();
}
