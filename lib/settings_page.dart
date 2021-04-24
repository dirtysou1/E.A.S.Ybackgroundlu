import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:easy/Styles.dart';
import 'package:easy/main.dart';
import 'package:easy/values/values.dart';
import 'package:easy/views/LoginScreen.dart';
import 'package:easy/widgets/potbelly_button.dart';
import 'package:easy/widgets/spaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class SettingsPage2 extends StatefulWidget {
  SettingsPage2({Key key}) : super(key: key);

  @override
  _SettingsPage2State createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<SettingsPage2> {

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
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                  Center(
                    child: new Text(
                      'E-posta adresiniz: $finalEmail',
                      style: TextStyle(),
                    ),
                  ),



                    ],
                  )),
            ),
            SpaceH16(),
            Container(
             // width: 50,
              //height: 50,
              decoration: BoxDecoration(
              color: Color.fromRGBO(42, 41, 41, 0.30196078431372547),
              borderRadius: BorderRadius.circular(10),
            ),

              child: PotbellyButton(
                StringConst.CIKIS,
                onTap: () async {
                  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                 sharedPreferences.remove('email');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                },
                ),
              ),

          ],
        ),
      ),
    ));
  }
}
