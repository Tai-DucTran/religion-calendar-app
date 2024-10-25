import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:religion_calendar_app/src/modules/authentication/exceptions/authenticator_exceptions.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/authentication/constants/auth_constants.dart';
import 'package:religion_calendar_app/src/modules/user/models/user_id.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
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
  bool? get isVerifiedEmail => currentUser?.emailVerified;

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
        /// TODO (Tai): Handle verify flow
        /// https://taisidehustle.atlassian.net/browse/KAN-11
        /// await sendEmailVerification(user);
        return AuthResults.success;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      e.code.log();
      switch (e.code) {
        case 'weak-password':
          throw WeakPasswordAuthException();
        case 'email-already-in-use':
          throw EmailAlreadyInUseAuthException();
        case 'invalid-email':
          throw InvalidEmailAuthException();
        default:
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
        return AuthResults.failure;
      }
    } on FirebaseAuthException catch (e) {
      e.code.log();
      switch (e.code) {
        case 'user-not-found':
          throw UserNotFoundAuthException();
        case 'wrong-password':
          throw WrongPasswordAuthException();
        // TODO (Tai): Find the reason why it only throws `invalid-credential` for most of all cases
        // https://taisidehustle.atlassian.net/browse/KAN-66
        case 'invalid-credential':
          throw InvalidCredentialAuthException();
        // TODO (Tai): Handled this case to prevent DOS attack
        // https://taisidehustle.atlassian.net/browse/KAN-66
        case 'too-many-requests':
          throw TooManyRequestAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  Future<void> sendEmailVerification(User? user) async {
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
