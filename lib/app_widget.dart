import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_test_app/modules/home/home_page.dart';
import 'package:flutter_test_app/shared/theme/style.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Test App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
        const Locale('es', 'ES'),
        const Locale('en', 'US'),
      ],

      // theme: ThemeData.dark(),
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        fontFamily: "Roboto",
        /*textTheme: TextTheme(
              bodyText2: TextStyle(color: kBodyTextColor),
            )*/
      ),
      initialRoute: '/',
      routes: {'/': (ctx) => HomePage()},
    );
  }
}
