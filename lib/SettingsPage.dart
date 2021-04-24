import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';


import 'package:easy/main.dart';
import 'package:easy/values/values.dart';
import 'package:easy/views/LoginScreen.dart';
import 'package:easy/widgets/potbelly_button.dart';
import 'package:easy/widgets/spaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/spaces.dart';



class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/yol.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          child: Column(
            children: [
              Container(child: Center()),
              Center(
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 50,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0,top: 80),
                  child: Center(
                    child: Column(
                      children: [
                        SpaceH40(),
                        Center(child: Text('BU SAYFAYA UYGULAMA HAKKINDA BİLGİLER YAZILACAK',style: Styles.customNormalTextStyle(fontSize: 20),)),
                      ],
                    ),
                  ),
                ),
              ),
              SpaceH16(),
              Container(
                // width: 50,
                //height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(42, 41, 41, 0.30196078431372547),
                  borderRadius: BorderRadius.circular(10),
                ),


              ),
            ],
          ),
        ),
      ),
    ));
  }
}
