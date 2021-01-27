import 'package:flutter/material.dart';
import 'package:kawal_corona/resources/style/Style.dart';


class Accordion extends StatelessWidget {
  String _title;
  Color _colorIcon;
  String _image;

  Accordion(this._title, this._colorIcon, this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0xff071135).withOpacity(0.04),
              blurRadius: 30,
              offset: Offset(0, 15.0))
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              padding: EdgeInsets.all(13),
              height: 50,
              child: Image(image: AssetImage(this._image), width: 35,),
              decoration: BoxDecoration(
                  color: this._colorIcon.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                this._title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Spacer(),
            RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.arrow_back_ios_rounded,
                  size: 17, color: primaryGrey),
            )
          ],
        ));
  }
}
