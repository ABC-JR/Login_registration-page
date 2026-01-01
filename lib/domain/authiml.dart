import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:login_register_app/data/UserAuth.dart';
import 'package:login_register_app/domain/auth.dart';

class Authiml implements Auth {
  FirebaseAuth firebaseAuth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Authiml({required this.firebaseAuth});

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<Userauth> usersignin(String email, String password) async {
    var result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user!;
    return Userauth(email: user.email.toString(), uid: user.uid);
  }

  @override
  Future<Userauth> usersignup(String email, String password) async {
    var result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    var user = result.user!;

    return Userauth(email: user.email.toString(), uid: user.uid);
  }

  

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }
}
