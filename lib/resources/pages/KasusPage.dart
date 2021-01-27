import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kawal_corona/resources/components/BottomNav.dart';
import 'package:kawal_corona/resources/components/DataNumber.dart';
import 'package:kawal_corona/resources/components/TemplatesPage.dart';
import 'package:kawal_corona/resources/style/Style.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class KasusPage extends StatefulWidget {
  @override
  _KasusPageState createState() => _KasusPageState();
}

class _KasusPageState extends State<KasusPage> {
  String _dropdownValue = "DKI Jakarta";
  List _data = [];
  List<String> _provinsi = [];
  String _tanggal;
  int _index = 0;

  Future<String> getData() async {
    var response = await http.get("https://api.kawalcorona.com/indonesia/provinsi",
        headers: {'accepts': 'aplication/json'});

    setState(() {
      var result = json.decode(response.body);
      this._data = result;
      
      for (var i = 0; i < this._data.length; i++) {
        this._provinsi.add(this._data[i]["attributes"]["Provinsi"]);
      }
    });
  }

  _KasusPageState() {
    this.getData();

    var now = DateTime.now();
    var date = DateFormat('d MMMM').format(now);
    this._tanggal = date;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        bottomNavigationBar: BottomNav(0),
        body: SafeArea(
            child: SingleChildScrollView(
                child: TemplatesPage("Kasus\nCOVID-19", [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: primaryGrey, style: BorderStyle.solid, width: 1),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.location_on,
                    color: primaryGreen,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: DropdownButton<String>(
                    value: this._dropdownValue,
                    icon: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                    iconSize: 20,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        color: primaryBlack,
                        fontSize: 16),
                    onChanged: (String newValue) {
                      setState(() {
                        this._dropdownValue = newValue;
                        for (var i = 0; i < this._data.length; i++) {
                          if(this._data[i]["attributes"]["Provinsi"] == this._dropdownValue) {
                            this._index = i;
                          }
                        }
                      });
                    },
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    items: this._provinsi
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 17),
            child: Text("Update Kasus Corona", style: titleBody),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Terakhir diupdate tanggal ${this._tanggal}",
                style: subTitleBody.copyWith(color: primaryGrey),
              ),
              InkWell(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Lihat Detail",
                        style: subTitleBody.copyWith(color: primaryGreen),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: primaryGreen,
                      )
                    ],
                  ),
                  onTap: () {})
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff071135).withOpacity(0.05),
                  spreadRadius: 0,
                  blurRadius: 30,
                  offset: Offset(0, 15), // changes position of shadow
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DataNumber(
                    Icons.coronavirus,
                    (this._data.length > 0)
                        ? this._data[this._index]["attributes"]["Kasus_Posi"].toString()
                        : "---",
                    "Positif",
                    primaryOrange),
                DataNumber(
                    Icons.cancel,
                    (this._data.length > 0)
                        ? this._data[this._index]["attributes"]["Kasus_Meni"].toString()
                        : "---",
                    "Meninggal",
                    primaryRed),
                DataNumber(
                    Icons.healing,
                    (this._data.length > 0)
                        ? this._data[this._index]["attributes"]["Kasus_Semb"].toString()
                        : "---",
                    "Sembuh",
                    primaryGreen)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 17),
            child: Text("Peta Persebaran", style: titleBody),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 17, bottom: 17),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff071135).withOpacity(0.05),
                  spreadRadius: 0,
                  blurRadius: 30,
                  offset: Offset(0, 15), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.cover)),
            ),
          )
        ]))),
      ),
    );
  }
}
