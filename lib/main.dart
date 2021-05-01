import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'dart:ui';
import 'package:background_location/background_location.dart';

import 'package:easy/widgets/app_retain_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy/plugins_utils/DeviceInfo.dart';
import 'package:easy/plugins_utils/Location.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:volume_watcher/volume_watcher.dart';
import 'package:battery/battery.dart';
import 'package:http/http.dart' as http;
import 'package:telephony/telephony.dart';
import 'package:easy/Butonlar.dart';
import 'package:easy/Yaknlarm.dart';
import 'package:easy/SonDepremler.dart';
import 'package:easy/views/LoginScreen.dart';
import 'ProfilSayfasi.dart';

import 'background_main.dart';
import 'views/LoginScreen.dart';
String konum,enlem,boylam,enlemDigit,boylamDigit;
int enlemEksi2,enlemArti2,longtitudeEksi2,longtitudeArti2;

AudioPlayer advancedPlayer;

AudioCache audioCache;
myToast1(String toast){
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white
  );
}

final _channel = const MethodChannel('com.example/app_retain');
String lastIsim,lastSoyisim,lastDogumyili,LastTel;

bool Guvendemi;
Future<void> main() async {

  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));



  print('$soyisim, $isim AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');




  //CounterService.instance().startCounting();

}





String finalEmail;
String finalID;
String finalisim,finaldogumyili,finalil,finalsoyisim,finaltel;


/// This is the main application widget.
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

bool ceksinmi;
double initVolume;
double maxVolume;
bool selfYardimSil;
class _MyAppState extends State<MyApp> {



  @override
  void initState(){

    const oneSec = const Duration(seconds: 5);
    Timer.periodic(oneSec, (Timer timer) {


      print("Veri alınıyor...");

      // This statement will be printed after every one second
    });

    getValidationData().whenComplete(() async {
      Timer(Duration(seconds:0),()=> Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => (finalEmail==null ? LoginScreen() : MyStatefulWidget()))));


    });
    super.initState();
lokaCek(ceksinmi);
    initPlayer();
    initPlatformState();

  }


  double latitudeMinus;
  double longitudePlus;
  double latitudePlus;
  double longitudeMinus;
  String latitude;
  String longtitude;


void lokaCek(bool ceksinmi)async {
  if (ceksinmi == true) {
   // await BackgroundLocation.startLocationService(distanceFilter: 20);
    BackgroundLocation.getLocationUpdates((location1) {
      setState(() {
        this.latitudeMinus = location1.latitude - 2;
        this.longitudeMinus = location1.longitude - 2;
        this.longitudePlus = location1.longitude + 2;
        this.latitudePlus = location1.latitude + 2;
        this.latitude = (location1.latitude).toString();
        this.longtitude = (location1.longitude).toString();
      });
      print("""\n
                       Latitude:$latitude
                       Longtitude : $longtitude
                       Latitude-2:  $latitudeMinus
                        Longitude-2: $longitudeMinus
                        Latitude+2 : $latitudePlus
                        Longtitude+2 $longitudePlus
                      """);
    });
  }
}

  myToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }


  Duration _duration = new Duration();
  Duration _position = new Duration();


  void initPlayer() {
    advancedPlayer = new AudioPlayer();

    audioCache =
    new AudioCache(fixedPlayer: advancedPlayer, respectSilence: false);

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
  bool _switchValue = true;

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



  static const String _title = 'E.A.S.Y';
  Future getValidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString('email');
    var obtainID = sharedPreferences.getString('id');
    var obtainisim = sharedPreferences.getString('isim');
    var obtainsoyisim = sharedPreferences.getString('soyisim');
    var obtainnumara = sharedPreferences.getString('tel');
    var obtainil = sharedPreferences.getString('il');
    var obtaindogumyili = sharedPreferences.getString('dogumyili');

    setState((){
      finalEmail = obtainEmail;
      finalID = obtainID;
      finalisim =obtainisim;
      finalsoyisim = obtainsoyisim;
      finaldogumyili= obtaindogumyili;
      finalil =obtainil;
      finaltel = obtainnumara;

      /*finalyakinnumara1= obtainYakinnumara1;
    finalyakinisim1 = obtainYakinisim1;
    finalyakinoyisim1 =obtainYakinsoyisim1;*/

    });
    print(finalEmail);
    print(finalID);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: AppRetainWidget(
          child: LoginScreen(),
        )
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
void dogrula() async{
  if(isim==null){
    isim=finalisim;
    soyisim=finalsoyisim;
    il= finalil;
    dogumyili=finaldogumyili;
    id=finalID;
    tel=finaltel;
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('isim', isim);
    sharedPreferences.setString('soyisim', soyisim);
    sharedPreferences.setString('il', il);
    sharedPreferences.setString('dogumyili', dogumyili);
    sharedPreferences.setString('id', id);
    sharedPreferences.setString('tel', tel);


  }
}
  @override
  void initState(){

dogrula();

    super.initState();

/*Timer(Duration(seconds: 5), () async {
  Fonksiyonlar _fonks = Fonksiyonlar();
_fonks.lokka();


});*/


  }


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.red);

  final List<Widget> _widgetOptions = <Widget>[
    Butonlar(),
    ProfilSayfasi(),
    Yaknlarm(),
    Depremapi(),
  ];

  void _onItemTapped(int index) {
    setState(() {

      _selectedIndex = index;

    });
  }


  //(child: _widgetOptions.elementAt(_selectedIndex))
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.transparent, body: Center(
      child:_widgetOptions.elementAt(_selectedIndex),
    ),
      bottomNavigationBar: Container(//margin: EdgeInsets.only(top: 50.0),
          padding: EdgeInsets.only(left: 5,right: 5),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(40),

            boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
        ),

        child:ClipRRect(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)
        ),

            child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),activeIcon:Icon(Icons.home) ,
              label: 'Anasayfa',
              backgroundColor: Color.fromRGBO(54,54,54,1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),activeIcon:Icon(Icons.account_box) ,
              label: 'Profil',
              backgroundColor: Color.fromRGBO(54,54,54,1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.family_restroom_outlined),
              label: 'Yakınlarım',
              backgroundColor: Color.fromRGBO(54,54,54,1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apartment_outlined),
              activeIcon: Icon(Icons.apartment),
              label: 'Son Depremler',
              backgroundColor: Color.fromRGBO(54,54,54,1),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        )),
      ),
    );
  }
}

final Battery _battery = Battery();
LocationService loca1 = new LocationService();
UserLocation Loca = new UserLocation();
bool yardim;
final telephony = Telephony.instance;
LocationService loca2 = new LocationService();
void NumaraCek() async {
  var url = 'https://www.easyrescuer.com/NumaraCekme.php';
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  final LOCA = (await loca1.location.getLocation()).toString();
  sharedPreferences.setString('Location', LOCA);
  var konum = await sharedPreferences.getString('Location');
  final SharedPreferences numara = await SharedPreferences.getInstance();
  final Telephony telephony = Telephony.instance;
  var response = await http.post(Uri.parse(url), body: {
    "userid": finalID.toString().trim(),
  });

  List text = jsonDecode(response.body);
  text.forEach((element) {
    var a = element.toString();
    dynamic intValue = int.parse(a.replaceAll(RegExp('[^0-9]'), ''));


    dynamic konumKord = int.parse(LOCA.replaceAll(RegExp('[^0-9]'), ''));


    String konum = konumKord.toString();

    var Koordinat = konum.substring(0,2)+"."+konum.substring(2,8)+", "+konum.substring(9,11)+"."+konum.substring(11);

    print(intValue);

    String guvende =
        "Merhaba, sizi yakını olarak ekleyen ${finalisim.toUpperCase()} ${finalsoyisim.toUpperCase()} güvende olduğunu belirtti. Koordinatları: $Koordinat easyrescuer.com";
    String yardimmesaj =
        "SİZİ YAKINI OLARAK EKLEYEN ${finalisim.toUpperCase()} ${finalsoyisim.toUpperCase()} 30DK BOYUNCA GÜVENDEYİM BUTONUNA BASMADI. YARDIMA İHTİYACI OLABİLİR. EĞER BU KİŞİNİN GÜVENLİĞİNDEN EMİNSENİZ LÜTFEN YAKINLARIM SEKMESİNDEN BU KİŞİ GÜVENDE BUTONUNA BASINIZ. Koordinatları: $Koordinat easyrescuer.com";


    print(guvende);
    telephony.sendSms(
        to: "+90$intValue", message: yardim ? yardimmesaj : guvende);
  }
    //print(element.toString());

  );
}

void selfYardim()async{
  selfYardimSil=true;
  yardim = true;


  VolumeWatcher.setVolume(maxVolume); //sesi maximuma çıkarır
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  //batarya bilgisini alır
  final int batteryLevel = await _battery.batteryLevel;
  String batterylevel = batteryLevel.toString();

  sharedPreferences.setString('battery', batterylevel);

  print("Battery level is: $batterylevel");

  //telefonun modelini öğrenir
  final String model = await DeviceInfo.getAndroidDeviceInfo();
  print(model);
  sharedPreferences.setString('model', model);

  //konumu alır
  // ignore: non_constant_identifier_names





  final LOC = (await loca1.location.getLocation()).toString();

  dynamic intValue = int.parse(LOC.replaceAll(RegExp('[^0-9]'), ''));


  String konum = intValue.toString();

  var Kordinat = konum.substring(0,2)+"."+konum.substring(2,8)+","+konum.substring(9,11)+"."+konum.substring(11);

  sharedPreferences.setString('Location', Kordinat);

  print(LOC);

  //popup mesajını ekranda gösterir

  //alarmı çalar
  audioCache.loop(
    "alarm.mp3",
    stayAwake: true,
  );

  addData();

  NumaraCek();
}


/*void DepremCek() async {

print("sdfsdfsdfsdfsdf");
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  final LOCA = (await loca2.location.getLocation()).toString();
  sharedPreferences.setString('Location2', LOCA);

  dynamic intValue = int.parse(LOCA.replaceAll(RegExp('[^0-9]'), ''));


  String konum = intValue.toString();

  var Kordinat = konum.substring(0,2)+"."+konum.substring(2,8)+","+konum.substring(9,11)+"."+konum.substring(11);

  var enlemDigit = konum.substring(2,8);
  var boylamDigit = konum.substring(11,16);

  var enlem=konum.substring(0,2);
  var boylam =konum.substring(9,11);



  int enlemEksi2 =int.parse(enlem)-2;
  int enlemArti2 =int.parse(enlem)+2;

  int longtitudeEksi2 =int.parse(boylam)-2;
  int longtitudeArti2 =int.parse(boylam)+2;




  var enlemliboylamli ="https://easydepremapi.herokuapp.com/api?minenlem=$enlemEksi2.$enlemDigit&maxenlem=$enlemArti2.$enlemDigit&minboylam=$longtitudeEksi2.$boylamDigit&maxboylam=$longtitudeArti2.$boylamDigit&min=5.0";
  var url = 'https://easydepremapi.herokuapp.com/api?min=2.0';
print(enlemliboylamli);

  var response = await http.get(
    Uri.parse(enlemliboylamli),
  );

  List text = jsonDecode(response.body);
  print(text);

  if(text.length!=0){
    myToast("5 ŞİDDETİNDE YA DA DAHA FAZLA BİR DEPREM OLDU. 30 DK İÇİNDE GÜVENDEYİM BUTONUNA BASMAZSANIZ BİLGİLERİNİZ YAKINLARINIZLA PAYLAŞILIP YARDIM EKİPLERİ ÇAĞIRILACAKTIR");
    Guvendemi=false;

    Timer(Duration(seconds: 1800), () async {
      if(Guvendemi==false){
        selfYardim();
      }});

  }
  return json.decode(response.body);
}*/

var urlTehlike = "https://www.easyrescuer.com/yardim.php";
void addData() async {
  selfYardimSil=true;
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  var now =DateTime.now();
  var isim = await sharedPreferences.getString('isim');
  var tel = await sharedPreferences.getString('tel');
  var dogumyili = await sharedPreferences.getString('dogumyili');
  var soyisim = await sharedPreferences.getString('soyisim');
  var konum = await sharedPreferences.getString('Location');
  var model = await sharedPreferences.getString('model');
  var battery = await sharedPreferences.getString('battery');
  if(id==null){
    id=finalID;

  }
  var response = await http.post(Uri.parse(urlTehlike), body: {
    "yardim_Otomatik":"OTO",
    "userid":id.trim(),
    "yardim_Tarih": now,
    "yardim_isim": isim.trim(),
    "yardim_soyisim": soyisim.trim(),
    "yardim_DogumYili": dogumyili.trim(),
    "yardim_tel": tel.trim(),
    "yardim_TelBatarya": battery.trim(),
    "yardim_TelefonModel": model.trim(),
    "yardim_konum": konum.trim(),
  });
  var jsonData = jsonDecode(response.body);
  var jsonString = jsonData['message'];

  if (jsonString == 'Yardım çağrınız alınmıştır.') {
    var mesaj = myToast(jsonString).toString();

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
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white
  );
}
