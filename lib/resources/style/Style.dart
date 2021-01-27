import 'package:flutter/material.dart';

Color whiteColor = Color(0xffFFFFFF);
Color primaryGreen = Color(0xff419E92);
Color primaryBlack = Color(0xff444444);
Color primaryGrey = Color(0xffA7ABBA);
Color primaryOrange = Color(0xffFFA471);
Color primaryRed = Color(0xffF17373);

TextStyle titleHeader = TextStyle(
    fontSize: 36,
    fontFamily: "Kanit",
    fontWeight: FontWeight.w700,
    color: whiteColor,
    height: 1.1,
    shadows: <Shadow>[
      Shadow(
          offset: Offset(0, 4.0),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.1))
    ]);

TextStyle city = TextStyle(
    fontFamily: "Kanit",
    fontWeight: FontWeight.w400,
    color: primaryBlack,
    fontSize: 14);

TextStyle titleBody = TextStyle(
  color: primaryBlack,
  fontSize: 23,
  fontFamily: "Kanit",
  fontWeight: FontWeight.w600
);

TextStyle subTitleBody = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  fontFamily: "Kanit",
);

TextStyle textNumber = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w400,
  fontFamily: "Kanit",
);