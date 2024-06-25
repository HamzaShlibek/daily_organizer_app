import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toolkit_app/provider/app_provider.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.read<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.calendar),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2008, 12, 14),
            lastDay: DateTime.utc(2108, 12, 14),
            focusedDay: DateTime.now(),
            locale:
                appProvider.appLocale == const Locale('en') ? 'en_US' : 'ar_LY',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.date,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            VerticalDivider(),
                            Center(
                              child: Text(
                                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.time,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            VerticalDivider(),
                            Center(
                              child: StreamBuilder(
                                stream:
                                    Stream.periodic(const Duration(seconds: 1)),
                                builder: (context, snapshot) => Text(
                                  DateFormat('hh:mm:ss').format(DateTime.now()),
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
