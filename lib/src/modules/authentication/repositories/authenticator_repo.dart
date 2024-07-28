import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:religion_calendar_app/src/modules/authentication/exceptions/authenticator_exceptions.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/authentication/constants/auth_constants.dart';
import 'package:religion_calendar_app/src/modules/user/models/user_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authenticator_repo.g.dart';

@riverpod
AuthenticatorRepository authenticatorRepository(
    AuthenticatorRepositoryRef ref) {
  return const AuthenticatorRepository();
}

class AuthenticatorRepository {
  const AuthenticatorRepository();

  User? get currentUser => FirebaseAuth.instance.currentUser;
  UserId? get userId => currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName => currentUser?.displayName ?? '';
  String? get email => currentUser?.email;

  FirebaseAuth get _auth => FirebaseAuth.instance;

  Future<void> logOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  Future<AuthResults> loginWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();

    // To check if the user aborts the login process or not
    // We will check the returned token from [loginResult]
    final token = loginResult.accessToken?.token;
    if (token == null) {
      return AuthResults.aborted;
    }

    final oauthCredentials = FacebookAuthProvider.credential(token);

    try {
      await _auth.signInWithCredential(
        oauthCredentials,
      );
      return AuthResults.success;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    }
  }

  Future<AuthResults> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        AuthConstants.emailScope,
      ],
    );

    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResults.aborted;
    }

    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(
        oauthCredentials,
      );
      return AuthResults.success;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    }
  }

  Future<AuthResults> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return AuthResults.success;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  Future<AuthResults> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = currentUser;
      if (user != null) {
        return AuthResults.success;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }
}
