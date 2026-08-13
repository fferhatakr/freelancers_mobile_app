import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (name.isEmpty) {
      throw Exception('name-required');
    }
    if (email.isEmpty) {
      throw Exception('email-required');
    }
    if (password != confirmPassword) {
      throw Exception('password-mismatch');
    }
    if (password.length < 8) {
      throw Exception('password-too-short');
    }
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
