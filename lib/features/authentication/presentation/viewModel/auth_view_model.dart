import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_movies/features/authentication/data/repository/auth_repository.dart';
import 'package:i_movies/features/authentication/presentation/viewModel/base_view_model.dart';
import 'package:i_movies/utils/enum/appState.dart';

class AuthViewModel extends BaseModel {
  AuthRepository authRepository = AuthRepository();

  Future<User?> register(email, password, BuildContext context) async {
    try {
      setAppState(AppState.busy);
      User? user = await authRepository.registerUser(
        email,
        password,
      );
      setAppState(AppState.idle);
      return user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
    throw Exception('An error occurred');
  }

  Future<User?> signIn(email, password, BuildContext context) async {
    try {
      setAppState(AppState.busy);
      User? user = await authRepository.signInUser(email, password);
      setAppState(AppState.idle);
      return user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
    throw Exception('An error occurred');
  }

  Future<User?> logOut() async {
    setAppState(AppState.busy);
    await authRepository.logOut();
    setAppState(AppState.idle);
    return null;
  }
}
