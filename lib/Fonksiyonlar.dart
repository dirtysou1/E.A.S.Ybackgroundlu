import 'dart:async';
import 'dart:convert';
import 'package:background_location/background_location.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy/plugins_utils/DeviceInfo.dart';
import 'package:easy/plugins_utils/Location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'package:volume_watcher/volume_watcher.dart';
import 'package:battery/battery.dart';
import 'package:http/http.dart' as http;
import 'package:easy/views/LoginScreen.dart';
import 'main.dart';
import 'views/LoginScreen.dart';

class Fonksiyonlar{

  Fonksiyonlar(){
   // lokka();
   // addDataF();
  //  DepremCekF(latitudeMinus,longitudeMinus,latitudePlus,longitudePlus);
   // deneme();
  }


  final Battery _battery = Battery();
  LocationService loca1 = new LocationService();
  UserLocation Loca = new UserLocation();
  bool yardim;

  final telephony = Telephony.instance;

  LocationService loca2 = new LocationService();
  void NumaraCekF() async {
    var url = 'https://www.easyrescuer.com/NumaraCekme.php';
  /*  final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var isimF = await sharedPreferences.getString('isim');
    var soyisimF = await sharedPreferences.getString('soyisim');*/

    final SharedPreferences numara = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse(url), body: {
      "userid": finalID.toString().trim(),
    });

    List text = jsonDecode(response.body);
    text.forEach((element) {
      var a = element.toString();
      dynamic intValue = int.parse(a.replaceAll(RegExp('[^0-9]'), ''));







      var Koordinat = '$latitude, $longtitude';

      print(intValue);

      String guvende =
          "Merhaba, sizi yakını olarak ekleyen ${isim.toUpperCase()} ${soyisim.toUpperCase()} güvende olduğunu belirtti. Koordinatları: $Koordinat easyrescuer.com";
      String yardimmesaj =
          "SİZİ YAKINI OLARAK EKLEYEN ${finalisim.toUpperCase()} ${finalsoyisim.toUpperCase()} 30DK BOYUNCA GÜVENDEYİM BUTONUNA BASMADI. YARDIMA İHTİYACI OLABİLİR. EĞER BU KİŞİNİN GÜVENLİĞİNDEN EMİNSENİZ LÜTFEN YAKINLARIM SEKMESİNDEN BU KİŞİ GÜVENDE BUTONUNA BASINIZ. Koordinatları: $Koordinat easyrescuer.com";


      print(guvende);
      backgrounMessageHandler(SmsMessage message) async {
        // Handle background message
        Telephony.backgroundInstance.sendSms(to: "$intValue", message: "$yardimmesaj");
      }
    }
      //print(element.toString());

    );
  }
String battery,telmodel;
String yardimDatasi;
  void selfYardimF()async{
    selfYardimSil=true;
    yardim = true;


    VolumeWatcher.setVolume(maxVolume); //sesi maximuma çıkarır
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    //batarya bilgisini alır
    final int batteryLevel = await _battery.batteryLevel;
    String batterylevel = batteryLevel.toString();

    battery=batterylevel;

    print("Battery level is: $batterylevel");

    //telefonun modelini öğrenir
    final String model = await DeviceInfo.getAndroidDeviceInfo();
    print(model);
    telmodel= model;
    sharedPreferences.setString('model', model);

    //konumu alır
    // ignore: non_constant_identifier_names









    //popup mesajını ekranda gösterir

    //alarmı çalar
    /*audioCache.loop(
      "alarm.mp3",
      stayAwake: true,
    );*/

    addDataF();


  }


  double latitudeMinus;
  double longitudePlus;
  double latitudePlus;
  double longitudeMinus;
  String latitude;
  String longtitude;
  bool acilis;
  void lokka() async {
    acilis=true;
/*    await BackgroundLocation.setAndroidNotification(
      title: "E.A.S.Y. sizi koruyor",
      message: "Uygulamayı durdurmayın L.",
      icon: "@mipmap/ic_launcher",
    );*/
await BackgroundLocation.checkPermissions();
    await BackgroundLocation.setAndroidConfiguration(2);
    await BackgroundLocation.startLocationService(distanceFilter: 10);
    BackgroundLocation.getLocationUpdates((location1) {
      this.latitudeMinus = location1.latitude-2;
      this.longitudeMinus = location1.longitude-2;
      this.longitudePlus = location1.longitude+2;
      this.latitudePlus = location1.latitude+2;
      this.latitude = (location1.latitude).toString();
      this.longtitude = (location1.longitude).toString();

    });

    print("""\n
                        Latitude-2:  $latitudeMinus
                        Longitude-2: $longitudeMinus
                        Latitude+2 : $latitudePlus
                        Longtitude+2 $longitudePlus

                      """);


  }
  void deneme(){
    print("dfsdfdıfgusjnkoalfjnglksşjngfdlmşsmgk fndnfgnadlfgnladfgnladfngkalfdgknadfgknadfg");
  }


bool depremOldu;

  void DepremCekF(double enlemAna ,double boylamAna, double enlemBaba, double boylamBaba) async {






  //  int boylammMinus2 = int.parse(boylamAna)-2;
   // int boylammPlus2 = int.parse(boylamAna)+2;


    print("$enlemAna, $enlemBaba,$boylamAna,$boylamBaba");
    //print("$ennnlemMinus2,$ennnlemPlus2");
    var enlemliboylamli ="https://easydepremapi.herokuapp.com/api?minenlem=$enlemAna&maxenlem=$enlemBaba&minboylam=$boylamAna&maxboylam=$boylamBaba&min=5.0";
    var url = 'https://easydepremapi.herokuapp.com/api?min=5.0';

print(enlemliboylamli);
    var response = await http.get(
      Uri.parse(enlemliboylamli),
    );

    List text = jsonDecode(response.body);
    print(text);

    if(text.length!=0){
    depremOldu=true;
      //Guvendemi=false;

      Timer(Duration(seconds: 5), () async {
        if(Guvendemi==false){
          //selfYardimF();
          myToast("5 ŞİDDETİNDE YA DA DAHA FAZLA BİR DEPREM OLDU. 30 DK İÇİNDE GÜVENDEYİM BUTONUNA BASMAZSANIZ BİLGİLERİNİZ YAKINLARINIZLA PAYLAŞILIP YARDIM EKİPLERİ ÇAĞIRILACAKTIR");
          Guvendemi=true;
        }});

    }
    return json.decode(response.body);
  }


  void addDataF() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    yardimDatasi ='yardim cagrisi';

    sharedPreferences.setString('yardimDatasi', yardimDatasi);
    selfYardimSil=true;

    var urlTehlike = "https://www.easyrescuer.com/yardim.php";
    var now =(DateTime.now()).toString();
    var isim = await sharedPreferences.getString('isim');
    var soyisim = await sharedPreferences.getString('soyisim');
    var dogumyili = await sharedPreferences.getString('dogumyili');
    var tel = await sharedPreferences.getString('tel');
    var id = await sharedPreferences.getString('id');


    var response = await http.post(Uri.parse(urlTehlike), body: {
      "yardim_Otomatik":"OTO",
      "userid":id,
      "yardim_Tarih": now,
      "yardim_isim": isim,
      "yardim_soyisim": soyisim,
      "yardim_DogumYili": dogumyili,
      "yardim_tel": tel,
      "yardim_TelBatarya": battery,
      "yardim_TelefonModel": telmodel,
      "yardim_konum": '$latitude,$longtitude'
    });
    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    yardimDatasi= 'yardim cagrisi alindi';
    if (jsonString == 'Yardım çağrınız alınmıştır.') {
      var mesaj = myToast(jsonString).toString();

      sharedPreferences.setString('yardimDatasi', 'yardim cagrisi alindi');
      //You can route to your desire page here

    } else {
      myToast(jsonString);
    }
  }
  myToast(String toast){
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }
}