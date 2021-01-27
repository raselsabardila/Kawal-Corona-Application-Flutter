import 'package:flutter/material.dart';
import 'package:kawal_corona/resources/style/Style.dart';

class TemplatesPage extends StatelessWidget {
  String _title;
  List<Widget> _content;

  TemplatesPage(this._title, this._content);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.only(left: 30, top: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/corona.png"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this._title, style: titleHeader),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 35, right: 35, top: 28),
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.8),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: this._content,
          ),
        ),
      ],
    );
  }
}
