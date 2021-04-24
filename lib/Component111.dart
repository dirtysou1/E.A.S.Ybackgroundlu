import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy/plugins_utils/DeviceInfo.dart';
import 'package:easy/plugins_utils/Location.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:volume_watcher/volume_watcher.dart';
import 'package:battery/battery.dart';

import 'Component121.dart';
import 'YardmBildirim.dart';
class Component111 extends StatefulWidget {
int flag;
 int get getFlag {
   return flag;
 }

  set setFlag(int flag) {
    this.flag=flag;
  }







  @override
  _Component111State createState() => _Component111State();



}


class _Component111State extends State<Component111> {
Component111 dd =  Component111();

  ////////////////////////////////

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;

  AudioCache audioCache;



  @override
  void initState() {
    super.initState();
    initPlayer();
    initPlatformState();
  }


  void initPlayer() {
    advancedPlayer = new AudioPlayer();

    audioCache = new AudioCache(fixedPlayer: advancedPlayer,respectSilence: false);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }
  String _platformVersion = 'Unknown';
  double currentVolume = 0;
  double initVolume = 0;
  double maxVolume = 0;





  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      VolumeWatcher.hideVolumeView = true;
      platformVersion = await VolumeWatcher.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    double initVolume;
    double maxVolume;
    try {
      initVolume = await VolumeWatcher.getCurrentVolume;
      maxVolume = await VolumeWatcher.getMaxVolume;
    } on PlatformException {
      platformVersion = 'Failed to get volume.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      this.initVolume = initVolume;
      this.maxVolume = maxVolume;
    });
  }


  final Battery _battery = Battery();
  LocationService loca1 = new LocationService();
  UserLocation Loca = new UserLocation();

void play(){

  if (dd.getFlag == 1) {
    audioCache.loop("alarm.mp3", stayAwake: true,);

  }
}

void stop(){
  if(dd.getFlag == 0){
    advancedPlayer.stop();
    advancedPlayer.dispose();
  }
  print(dd.getFlag);
}

  ////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98.9,
        height: 105.9,
        child:FlatButton(
      onPressed: ()async{
       // VolumeWatcher.setVolume(maxVolume); //sesi maximuma çıkarır

        //batarya bilgisini alır
        final int batteryLevel = await _battery.batteryLevel;
        String batter = batteryLevel.toString();
        print( "Battery level is: $batter");


        //telefonun modelini öğrenir
        DeviceInfo.getAndroidDeviceInfo();


        dd.setFlag=1;

        //konumu alır

        final LOC = (await loca1.location.getLocation()).toString();
        print(LOC);



        //alarmı çalar
        if (dd.getFlag == 1) {
          audioCache.loop("alarm.mp3", stayAwake: true,);


         if (dd.getFlag == 0) {
          advancedPlayer.stop();
          advancedPlayer.dispose();
        }
        print(dd.getFlag);
      }

      },
        child: Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 98.9, 105.9),
          size: Size(98.9, 105.9),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Stack(
            children: <Widget>[

              Pinned.fromSize(
                bounds: Rect.fromLTWH(0.0, 0.0, 98.9, 105.9),
                size: Size(98.9, 105.9),
                pinLeft: true,
                pinRight: true,
                pinTop: true,
                pinBottom: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0xff950404),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffffffff)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(12.4, 19.0, 69.0, 66.0),
          size: Size(98.9, 105.9),
          fixedWidth: true,
          fixedHeight: true,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/sos.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 1.0, color: const Color(0x00000000)),
            ),
          ),
        ),
      ],
    ) ));
  }
}
