import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sens_app/src/home_page.dart';
import 'package:sens_app/src/shared_preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
  ]);

  final prefs = new LocalData();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Your Sens App',
      theme: ThemeData(
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: BorderSide(color: Colors.grey, width: 2),
          )
        )
      ),
      home: HomePage(),
    );
  }
}
