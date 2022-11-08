import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
 var _themeMode = ThemeMode.light;
  ThemeMode get themeMode  => _themeMode;


  void setTheme(themeMode) async{
    final  pref = await SharedPreferences.getInstance();
    await pref.setString("themeMode", themeMode);
    _themeMode = themeMode;
    notifyListeners();
  }
  initialize() async {
    final  pref = await SharedPreferences.getInstance();
      _themeMode =  (pref.getString("themeMode")?? "system") as ThemeMode;
     notifyListeners();
  }
}