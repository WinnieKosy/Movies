import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_movies/features/authentication/presentation/view/screens/home_screen.dart';
import 'package:i_movies/features/onBoarding/presentation/view/onBoarding_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser!.reload();
      }
    });
    return StreamBuilder<User?>(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return const HomeScreen();
          }
          else if (snapshot.connectionState == ConnectionState.waiting){
            return  const Center(child:CircularProgressIndicator());
          }
          return const OnBoardingScreen();
        });
  }
}
