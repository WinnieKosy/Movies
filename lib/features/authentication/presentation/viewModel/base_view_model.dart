import 'package:flutter/cupertino.dart';
import 'package:i_movies/utils/enum/appState.dart';

class BaseModel extends ChangeNotifier {
  AppState _appState = AppState.idle;
  AppState get appState => _appState;

  void setAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}