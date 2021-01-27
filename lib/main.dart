import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kawal_corona/resources/pages/KasusPage.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff72CCC0),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kawal Korona',
      home: KasusPage(),
    );
  }
}
