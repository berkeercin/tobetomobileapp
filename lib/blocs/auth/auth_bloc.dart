// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_event.dart';
import 'package:tobetomobileapp/blocs/auth/auth_state.dart';
import 'package:tobetomobileapp/models/user.dart';
import 'package:tobetomobileapp/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFireStore;
  final UserRepostory userRepostory;
  AuthBloc(
      {required this.userRepostory,
      FirebaseAuth? firebaseAuth,
      FirebaseFirestore? firebaseFirestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseFireStore = firebaseFirestore ?? FirebaseFirestore.instance,
        super(CheckUserLoginData()) {
    _firebaseAuth.authStateChanges().listen((user) async {
      if (user != null) {
        final userFromDb = await _firebaseFireStore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        UserData _user = UserData.fromFireStore(userFromDb);
        emit(LoadedUser(user: _user));
      } else {
        emit(LogIn());
      }
    });

    on<LoginUser>(_loginUser);
    on<ReturnLoginScreen>(_loginPage);
    on<SignUpUser>(_signUpUser);
  }

  void _signUpUser(SignUpUser event, Emitter<AuthState> emit) async {
    try {
      await userRepostory.signUpUser(event.name, event.surname,
          event.email, event.password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(event.context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  void _loginUser(LoginUser event, Emitter<AuthState> emit) async {
    final userData = await userRepostory.loginUser(event.email, event.password);
    // emit(LoadedUser(user: userData));
    if (userData[0] == "success") {
      final userFromDb =
          await _firebaseFireStore.collection("users").doc(userData[1]).get();
      UserData _user = UserData.fromFireStore(userFromDb);
      emit(LoadedUser(user: _user));
    } else {
      ScaffoldMessenger.of(event.context)
          .showSnackBar(SnackBar(content: Text(userData[1]!)));
    }
  }

  void _loginPage(ReturnLoginScreen event, Emitter<AuthState> emit) async {
    await userRepostory.logoutUser();
    emit(LogIn());
  }
}
