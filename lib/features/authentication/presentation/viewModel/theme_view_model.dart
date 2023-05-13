import 'package:flutter/material.dart';

class AppThemeData extends ChangeNotifier{
  ThemeData themeData;

  AppThemeData(this.themeData);

  getTheme()=> themeData;

  changeThemeData(theme){
    themeData = theme;
    notifyListeners();
  }
}