import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_movies/features/authentication/presentation/viewModel/base_view_model.dart';
import 'package:i_movies/features/authentication/presentation/viewModel/theme_view_model.dart';
import 'package:i_movies/utils/constants/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeData>(
            create: (context) => AppThemeData(ThemeData.light())),
        ChangeNotifierProvider<BaseModel>(create: (context) => BaseModel())
      ],
      child: Consumer<AppThemeData>(
        builder: (context, data, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: data.getTheme(),
            initialRoute: '/',
            routes: Routes.getRoutes(),
          );
        },
      ),
    );
  }
}
