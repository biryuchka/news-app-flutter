import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = ChangeNotifierProvider(
        (ref) => StateTheme(),
);

class StateTheme extends ChangeNotifier {
  var themeData = false;

  void setLightTheme() {
    themeData = false;
    notifyListeners();
  }
  void setDarkTheme() {
    themeData = true;
    notifyListeners();
  }
}