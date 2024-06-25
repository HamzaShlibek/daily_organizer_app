import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/app_provider.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return DropdownButton<String>(
          padding: const EdgeInsets.all(12),
          borderRadius: BorderRadius.circular(12),
          elevation: 0,
          dropdownColor: Theme.of(context).colorScheme.primaryContainer,
          underline: Container(),
          value: value.selectedLanguage,
          items: [
            DropdownMenuItem(value: 'en', child: Text(value.languages[0])),
            DropdownMenuItem(value: 'ar', child: Text(value.languages[1]))
          ],
          // items: value.languages.map((lang) {
          //   return DropdownMenuItem(value: lang, child: Text(lang));
          // }).toList(),
          onChanged: (val) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('lang', val!);
            print('Language (Shared Preferences) : [$val]');

            value.changeAppLanguage(val);
          },
        );
      },
    );
  }
}
