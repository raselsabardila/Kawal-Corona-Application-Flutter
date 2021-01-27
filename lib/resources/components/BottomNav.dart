import 'package:flutter/material.dart';
import 'package:kawal_corona/resources/pages/InformasiPage.dart';
import 'package:kawal_corona/resources/pages/KasusPage.dart';
import 'package:kawal_corona/resources/pages/PusatBantuanPage.dart';
import 'package:kawal_corona/resources/style/Style.dart';

class BottomNav extends StatefulWidget {
  int _value;

  BottomNav(this._value);

  @override
  _BottomNavState createState() => _BottomNavState(this._value);
}

class _BottomNavState extends State<BottomNav> {
  int valueClick;

  _BottomNavState(this.valueClick);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 25,
      elevation: 35,
      currentIndex: this.valueClick,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: primaryGreen,
      unselectedItemColor: primaryGrey,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        setState(() {
          if (value != this.valueClick) {
            this.valueClick = value;

            switch (value) {
              case 0:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => KasusPage()));
                break;
              case 1:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => InformasiPage()));
                break;
              case 2:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PusatBantuanPage()));
                break;
              default:
            }
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          title: Padding(
            padding: EdgeInsets.only(bottom: 10, left: 30),
            child: Text('Kasus'),
          ),
          icon: Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Icon(Icons.coronavirus),
          ),
        ),
        BottomNavigationBarItem(
          title: Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text('Informasi'),
          ),
          icon: Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Icon(Icons.info_rounded)),
        ),
        BottomNavigationBarItem(
          title: Padding(
            padding: EdgeInsets.only(bottom: 10, right: 30),
            child: Text('Bantuan'),
          ),
          icon: Padding(
            padding: EdgeInsets.only(top: 10, right: 30),
            child: Icon(Icons.medical_services),
          ),
        ),
      ],
    );
  }
}
