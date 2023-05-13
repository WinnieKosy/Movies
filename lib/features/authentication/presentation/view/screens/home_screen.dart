import 'package:flutter/material.dart';
import 'package:i_movies/features/authentication/presentation/components/button_widget.dart';
import 'package:i_movies/features/authentication/presentation/viewModel/auth_view_model.dart';
import 'package:i_movies/features/authentication/presentation/viewModel/theme_view_model.dart';
import 'package:i_movies/utils/constants/routes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppThemeData theme = Provider.of<AppThemeData>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  theme.changeThemeData(ThemeData.light());
                },
                icon: const Icon(Icons.light_mode_rounded)),
            IconButton(
                onPressed: () {
                  theme.changeThemeData(ThemeData.dark());
                },
                icon: const Icon(Icons.nightlight_round_rounded))
          ],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              onPressed: (double e) async {
                await AuthViewModel().logOut();
                if(!mounted) return;
                Navigator.pushNamed(context, Routes.registrationScreen);
              },
              text: 'Log Out',
            )
          ],
        ));
  }
}
