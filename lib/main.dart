import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'Pages/content_page.dart';
import 'Pages/loginPage.dart';
import 'Pages/signupPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      locale: Locale('ar', 'AE'),
      title: 'Movie App',
      theme: ThemeData.dark(),
      home: ContentPage(),
      routes: {
        ContentPage.route: (context) => ContentPage(),
        LoginPage.route: (context) => LoginPage(),
        SignupPage.route: (context) => SignupPage(),
      },
    );
  }
}
