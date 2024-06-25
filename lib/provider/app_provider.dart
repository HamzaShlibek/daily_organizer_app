import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/note_model.dart';

// LATEST: [ Hwo to run (shared_preferences) in provider class ]

Locale _appLocale = Locale(_selectedLanguage.toLowerCase());
String _selectedLanguage = '';

class AppProvider extends ChangeNotifier {
  final SharedPreferences prefs;

  AppProvider(this.prefs) {
    _isDark = prefs.getBool('isDark');
    _selectedLanguage = prefs.getString('language') ?? 'en';
  }

  // code for change app theme to dark or light

  ThemeMode _themeMode = ThemeMode.light;
  static bool? _isDark;

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _isDark ?? false;

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDark');
    _isDark! ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
    print('Dark Mode : [$isDark]');
    print('Theme Mode : [$themeMode]');
    notifyListeners();
  }

  // code for change app language from [English] to [Arabic]

  final List<String> _languages = ['EN', 'AR'];

  Locale get appLocale => _appLocale;
  List<String> get languages => _languages;
  String get selectedLanguage => _selectedLanguage;

  void changeAppLanguage(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedLanguage = prefs.getString('lang')!;
    _appLocale = Locale(prefs.getString('lang').toString().toLowerCase());

    print('Change App Language to [${_appLocale.toString().toUpperCase()}]');
    notifyListeners();
  }
}
