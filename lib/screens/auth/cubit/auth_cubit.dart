// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentor_finder/repository/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(
            '',
            AuthStatus.loading,
            '',
          ),
        );
  final AuthApi api = AuthApi(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
    googleSignIn: GoogleSignIn(),
  );
  Future signInWithGoogle() async {
    final AuthState authState = await api.signInWithGoogle();
    if (authState.email != '') {
      emit(authState);
      return 'Success';
    }
    return;
  }
}
