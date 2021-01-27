import 'package:flutter/material.dart';
import 'package:kawal_corona/resources/components/Accordion.dart';
import 'package:kawal_corona/resources/components/BottomNav.dart';
import 'package:kawal_corona/resources/components/TemplatesPage.dart';
import 'package:kawal_corona/resources/style/Style.dart';

class InformasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        bottomNavigationBar: BottomNav(1),
        body: SingleChildScrollView(
          child: TemplatesPage("Kenali\nCOVID-19", [
            Text(
              "Apa Itu Virus Corona",
              style: titleBody,
            ),
            Accordion("Mengenal", primaryRed, "assets/images/virus.png"),
            Accordion("Mencegah", Colors.yellow, "assets/images/tangan.png"),
            Accordion("Mengobati", Colors.blue, "assets/images/pil.png"),
            Accordion("Mengantisipasi", primaryGreen, "assets/images/bumi.png"),
            SizedBox(height: 40),
          ]),
        ),
      )),
    );
  }
}
