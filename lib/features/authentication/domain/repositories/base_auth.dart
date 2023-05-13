import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<User?>registerUser(String email, String password );
  Future<User?>signInUser(String email, String password);
  Future<User?>logOut();
}