// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<StatefulWidget> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.comingSoon),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.comingSoon,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
