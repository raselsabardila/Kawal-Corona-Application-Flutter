import 'package:flutter/material.dart';
import 'package:kawal_corona/resources/components/Accordion.dart';
import 'package:kawal_corona/resources/components/BottomNav.dart';
import 'package:kawal_corona/resources/components/TemplatesPage.dart';
import 'package:kawal_corona/resources/style/Style.dart';
import 'package:url_launcher/url_launcher.dart';

class PusatBantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNav(2),
          body: SafeArea(
              child: SingleChildScrollView(
            child: TemplatesPage("Pusat\nBantuan", [
              Text(
                "Pusat Bantuan",
                style: titleBody,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 20),
                child: Text(
                  "Jika anda mengalami gejala gejala seperti ini, silahkan hubungi kontak dibawah ini",
                  style: TextStyle(color: primaryGrey, fontSize: 16),
                ),
              ),
              Accordion("Hotline", primaryGreen, "assets/images/phone.png"),
              Accordion(
                  "Konsultasi Dokter", Colors.blue, "assets/images/chat.png"),
              Accordion(
                  "Rumah Sakit Terdekat", primaryRed, "assets/images/plus.png"),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: _launchURL,
                child: Text('Show Flutter homepage'),
              ),
            ]),
          ))),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    ;
  }
}
