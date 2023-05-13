import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_movies/features/authentication/domain/repositories/base_auth.dart';

class AuthRepository extends BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> registerUser(String email, String password) async {
    UserCredential credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  @override
  Future<User?> signInUser(String email, String password) async {
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  }

  @override
  Future<User?> logOut() async {
    await _firebaseAuth.signOut();
  }
}
