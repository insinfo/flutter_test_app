import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_app/shared/theme/style.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      navigatorKey: Modular.navigatorKey,
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
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
