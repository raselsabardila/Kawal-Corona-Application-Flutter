import 'package:flutter/material.dart';
import 'package:kawal_corona/resources/style/Style.dart';

class DataNumber extends StatelessWidget {
  IconData _icon;
  String _data;
  String _typeData;
  Color _colorText;

  DataNumber(this._icon,this._data,this._typeData,this._colorText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: this._colorText.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            this._icon,
            size: 18,
            color: this._colorText,
          ),
        ),
        Text(
          this._data,
          style: textNumber.copyWith(color: this._colorText),
        ),
        Text(
          this._typeData,
          style: subTitleBody.copyWith(color: primaryGrey),
        )
      ],
    );
  }
}
