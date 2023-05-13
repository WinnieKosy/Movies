import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i_movies/features/authentication/presentation/components/button_widget.dart';
import 'package:i_movies/features/authentication/presentation/components/text_field_widget.dart';
import 'package:i_movies/features/authentication/presentation/viewModel/auth_view_model.dart';
import 'package:i_movies/utils/constants/routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
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
                isObscureText: true,
              ),
              TextFieldWidget(
                controller: confirmPasswordController,
                text: 'Confirm Password',
                isObscureText: true,
              ),
              ButtonWidget(
                  onPressed: (e) async {
                    if (passwordController.text == '' ||
                        emailController.text == '' ||
                        confirmPasswordController.text == '') {
                      Fluttertoast.showToast(msg: 'Fill all required field');
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      Fluttertoast.showToast(msg: 'Password do not match');
                    } else {
                      var data = await AuthViewModel().register(
                          emailController.text,
                          passwordController.text,
                          context);
                      if (data != null) {
                        if (!mounted) return;
                        Navigator.pushNamed(context, Routes.homeScreen);
                      }
                    }
                  },
                  text: 'Sign Up'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signInScreen);
                      },
                      child: const Text('Sign In'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
