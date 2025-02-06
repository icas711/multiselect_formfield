import 'package:flutter/material.dart';
import 'package:multiselect_formfield/home_page.dart';

import 'constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kAppBarBackgroundColor,
          foregroundColor: kAppBarForegroundColor,
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 22,
              color: kAppBarForegroundColor,
              fontWeight: FontWeight.w700),
          iconTheme: IconThemeData(
            color: kAppBarForegroundColor,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Select Demo'),
        ),
        body: const SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}
