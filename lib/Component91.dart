import 'dart:async';
import 'dart:ui';

import 'package:background_location/background_location.dart';
import 'package:easy/Fonksiyonlar.dart';
import 'package:easy/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:easy/Butonlar.dart';
import 'package:easy/main.dart';
import 'package:easy/plugins_utils/Location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'background_main.dart';
import 'counter.dart';
import 'counter_service.dart';
bool izinVerildimi;
class Component91 extends StatefulWidget {
  @override
  _Component91State createState() => _Component91State();
}
bool val;
class _Component91State extends State<Component91> {





LocationService loca1 = new LocationService();


  final Telephony telephony = Telephony.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[        Pinned.fromSize(
        bounds: Rect.fromLTWH(23.0, 29.0, 206.0, 53.0),
        size: Size(252.0, 86.0),
        pinLeft: true,
        pinRight: true,
        pinBottom: true,
        fixedHeight: true,
        child: Text(
          'İZİN VER',
          style: TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 20,
            color: const Color(0xf7ffffff),
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 252.0, 86.0),
          size: Size(252.0, 86.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Container(child:FlatButton(
            onPressed: ()async{
//konum için gerekli izinleri ister
              loca1.location.requestPermission();
              loca1.location.serviceEnabled();
              loca1.location.requestService();
              loca1.location.hasPermission();
              val=true;
              print('İZİN VER BUTOOOOOOOOOONUUUUUUU ${val}');


              izinVerildimi=true;
              Timer(Duration(seconds: 5), () async {
               // Fonksiyonlar _fonks =Fonksiyonlar();
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


                var channel = const MethodChannel('com.example/background_service');
                var callbackHandle = PluginUtilities.getCallbackHandle(backgroundMain);
                channel.invokeMethod('startService', callbackHandle.toRawHandle());

                sharedPreferences.setBool('boolean', val);
                var booleanSh = await sharedPreferences.getBool('boolean');
               // bool permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
               // _fonks.lokka();
                print("Yeah, this line is printed after 3 seconds");
                bool permissionsGranted = await telephony.requestSmsPermissions;
               // print(" izin verme seyi : $booleanSh");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>MyStatefulWidget() ));


              });



            },
              child:Text('')
          ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.0),
              color: const Color(0x6affffff),
              border: Border.all(width: 1.0, color: const Color(0x6a707070)),
            ),
          ),
        ),

      ],
    );
  }
}
