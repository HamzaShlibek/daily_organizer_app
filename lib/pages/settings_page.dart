import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolkit_app/provider/app_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/language_dropdown.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _loadData();
  // }

  // void _loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isDark', false);
  //   await prefs.setString('lang', 'ar');
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (
      BuildContext context,
      AppProvider value,
      Widget? child,
    ) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context)!.darkMode),
                leading: const Icon(Icons.dark_mode),
                trailing: Switch.adaptive(
                  value: value.isDark,
                  onChanged: (val) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('isDark', val);
                    print('Dark Mode (Shared Preferences) : [$val]');
                    setState(() {
                      val = !val;
                    });

                    value.toggleTheme();
                  },
                ),
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.lang),
                leading: const Icon(Icons.dark_mode),
                trailing: const Card(
                  child: LanguageDropdown(),
                ),
              ),
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('About Toolkit App'),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Gift from Hamza'),
                          Text('Created by Hamza Shlibek [iPowerDev7]'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                ),
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.about),
                  leading: const Icon(Icons.info_outline),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
