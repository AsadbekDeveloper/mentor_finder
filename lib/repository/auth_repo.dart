import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/auth/cubit/auth_cubit.dart';

class AuthApi {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  AuthApi({
    required this.firestore,
    required this.auth,
    required this.googleSignIn,
  });

  Future<AuthState> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credentials);
      if (userCredential.user != null) {
        return AuthState(
            'Successfull', AuthStatus.success, userCredential.user?.email??'');
      }
    } catch (e) {
      log(e.toString());
    }
      return const AuthState(
            'Unsuccessfull', AuthStatus.failure, '');
    
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    log("User Signed Out");
  }
}
