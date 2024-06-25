import 'package:flutter/material.dart';
import 'package:flutter_close_app/flutter_close_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toolkit_app/pages/timer_page.dart';

import '../components/route_with_transition.dart';
import 'calculator_page.dart';
import 'calendar_page.dart';
import 'game_page.dart';
import 'notes_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map> apps = [
      {
        'name': AppLocalizations.of(context)!.calculator,
        'icon': Icons.calculate,
        'appPage': const CalculatorApp(),
        'isExit': false,
      },
      {
        'name': AppLocalizations.of(context)!.calendar,
        'icon': Icons.calendar_month,
        'appPage': const CalendarApp(),
        'isExit': false,
      },
      {
        'name': AppLocalizations.of(context)!.notes,
        'icon': Icons.notes,
        'appPage': const NotesApp(),
        'isExit': false,
      },
      {
        'name': AppLocalizations.of(context)!.game,
        'icon': Icons.gamepad,
        'appPage': const GamePage(),
        'isExit': false,
      },
      {
        'name': AppLocalizations.of(context)!.timer,
        'icon': Icons.timer,
        'appPage': const TimerApp(),
        'isExit': false,
      },
      {
        'name': AppLocalizations.of(context)!.settings,
        'icon': Icons.settings_outlined,
        'appPage': const SettingsPage(),
        'isExit': false,
      },
      {
        'name': AppLocalizations.of(context)!.exit,
        'icon': Icons.exit_to_app,
        'appPage': null,
        'isExit': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.toolkitApp),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          shrinkWrap: true,
          itemCount: apps.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              onTap: () {
                apps[index]['isExit']
                    ? FlutterCloseApp.close()
                    : Navigator.of(context).push(createRoute(
                        widget: apps[index]['appPage'] ??
                            Scaffold(
                              appBar: AppBar(
                                title: const Text('Widget'),
                                centerTitle: true,
                              ),
                              body: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.comingSoon,
                                  style:
                                      Theme.of(context).textTheme.displaySmall!,
                                ),
                              ),
                            ),
                      ));
              },
              child: appItem(context, index, apps),
            ),
          ),
          // separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  Widget appItem(BuildContext context, int index, List<Map> apps) {
    List<String> customIcons = [
      'assets/icons/home_card_icons/calculator.png',
      'assets/icons/home_card_icons/calendar.png',
      'assets/icons/home_card_icons/notes.png',
      'assets/icons/home_card_icons/quiz_game.png',
      'assets/icons/home_card_icons/timer.png',
      'assets/icons/home_card_icons/settings.png',
      'assets/icons/home_card_icons/exit.png',
    ];

    return Card(
      child: Container(
        alignment: AlignmentDirectional.topCenter,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              customIcons[index],
              height: 90,
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  apps[index]['name'] ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
