
import 'package:flutter/cupertino.dart';
import 'package:i_movies/features/authentication/presentation/view/screens/base_screen.dart';
import 'package:i_movies/features/authentication/presentation/view/screens/home_screen.dart';
import 'package:i_movies/features/authentication/presentation/view/screens/registration_screen.dart';
import 'package:i_movies/features/authentication/presentation/view/screens/signIn_screen.dart';
import 'package:i_movies/features/onBoarding/presentation/view/onBoarding_screen.dart';

class Routes {
  static const String baseScreen = '/';
  static const String onBoarding = '/baseScreen';
  static const String registrationScreen = '/register';
  static const String signInScreen = '/signIn';
  static const String homeScreen = '/homScreen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.onBoarding: (context)=> const OnBoardingScreen(),
      Routes.baseScreen: (context) => const BaseScreen(),
      Routes.registrationScreen: (context) => const RegistrationScreen(),
      Routes.signInScreen: (context) => const SignInScreen(),
      Routes.homeScreen: (context) => const HomeScreen()
    };
  }
}
