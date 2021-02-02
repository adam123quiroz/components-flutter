import 'package:flutter/material.dart';

import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/home_page.dart';

void main() async {
  runApp(
    MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        '/alerts': (BuildContext context) => AlertPage(),
      },
    ),
  );
}
