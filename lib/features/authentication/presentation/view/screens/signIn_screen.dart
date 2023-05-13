import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i_movies/features/authentication/presentation/components/button_widget.dart';
import 'package:i_movies/features/authentication/presentation/components/text_field_widget.dart';
import 'package:i_movies/features/authentication/presentation/viewModel/auth_view_model.dart';
import 'package:i_movies/utils/constants/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                controller: emailController,
                text: 'Email',
                isObscureText: false,
              ),
              TextFieldWidget(
                  controller: passwordController,
                  text: 'Password',
                  isObscureText: true),
              ButtonWidget(
                onPressed: (e) async {
                  if (passwordController.text == '' ||
                      emailController.text == '') {
                    Fluttertoast.showToast(msg: 'Fill all required field');
                  } else {
                    await AuthViewModel().signIn(
                        emailController.text, passwordController.text, context);
                  }
                  if (!mounted) return;
                  Navigator.pushNamed(context, Routes.homeScreen);
                },
                text: 'Sign In',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registrationScreen);
                      },
                      child: const Text('Sign Up')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
