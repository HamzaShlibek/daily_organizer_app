import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'l10n/l10n.dart';
import 'provider/note_database.dart';
import 'pages/home_page.dart';
import 'provider/app_provider.dart';
import 'provider/search_provider.dart';
import 'style/theme.dart';

/*  SHARED PREFERENCES  */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  // initialize note isar database
  await NoteDatabase.initialize();

  runApp(MultiProvider(
    providers: [
      // Note Provider
      ChangeNotifierProvider(
        create: (BuildContext context) => NoteDatabase(),
      ),

      // App Provider
      ChangeNotifierProvider(
        create: (BuildContext context) => AppProvider(prefs),
      ),
      
      // Search Provider
      ChangeNotifierProvider(
        create: (BuildContext context) => SearchProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppProvider, NoteDatabase>(
      builder: (
        BuildContext context,
        AppProvider value,
        NoteDatabase value2,
        Widget? child,
      ) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          locale: value.appLocale,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: value.themeMode,
          // home: const HomePage(),
          title: 'Daily Organizer',
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          // initialRoute: '/',
          // routes: {
          //   '/': (context) => const HomePage(),
          // },
        );
      },
    );
  }
}
