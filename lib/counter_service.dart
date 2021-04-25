import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'package:easy/Component91.dart';
import 'package:easy/Fonksiyonlar.dart';
import 'package:easy/views/LoginScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'counter.dart';

class CounterService {





  factory CounterService.instance() => _instance;

  CounterService._internal();

  static final _instance = CounterService._internal();
static final _enlem = CounterService._internal();
  final _fonks = Fonksiyonlar();
  final _counter = Counter();
  final _izin = Counter();
  ValueListenable<int> get count => _counter.count;
  ValueListenable<int> get izin2 => _izin.izin;

  final telephony = Telephony.backgroundInstance;



  void startCounting() {
    Stream.periodic(Duration(seconds: 10)).listen((_) async{

      print('İZİN SAYACI 10 A GELİNCE LOKASYON ÇEKECEK ${_izin.izin.value}');
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      //_counter.increment();
      var url = "https://www.easyrescuer.com/yardim.php";
      print('${_izin.izin.value}');

      print('${_counter.isimF},${_counter.soyisimF},${_counter.numaraF},${_counter.idF}');


      var dogumyili = await sharedPreferences.getString('dogumyili')??null;


      var bool2 = await sharedPreferences.getBool('boolean')??null;
      var yardimCagrisi = await sharedPreferences.getString('yardimDatasi')??null;
      var guvendemi = sharedPreferences.getBool('Guvendemi');
      print("counter service izinverme şeysi: $bool2");


      int veriSayaci;
      if(/*yardimCagrisi!='yardim cagrisi alindi'||*/_fonks.depremOldu!=true) {
        _fonks.DepremCekF(
            _fonks.latitudeMinus, _fonks.longitudeMinus, _fonks.latitudePlus,
            _fonks.longitudePlus);
        print('Deprem mi oldu?? ${_fonks.depremOldu}');
            print('Yardım çağrısı alındı 1.si sharedprefs 2.fonks: $yardimCagrisi --- ${(_fonks.yardimDatasi)}');
        //_fonks.addDataF();
      }


      print('Deprem mi oldu22?? ${_fonks.depremOldu}');
      if(_fonks.depremOldu==true){
        _counter.increment();
        myToast("GÜVENDEYİM BUTONUNA BASMAZSANIZ OTOMATİK YARDIM ÇAĞRISI GİDECEK.");

        if(_counter.count.value>180&&_counter.count.value<182&&guvendemi!=true){
          _fonks.selfYardimF();


          var url = 'https://www.easyrescuer.com/NumaraCekme.php';

          final SharedPreferences numara = await SharedPreferences.getInstance();
          //final Telephony telephony = Telephony.instance;
          var response = await http.post(Uri.parse(url), body: {
            "userid": _counter.idF.toString().trim(),
          });

          List text = jsonDecode(response.body);
          text.forEach((element) {
            var a = element.toString();
            dynamic intValue = (int.parse(a.replaceAll(RegExp('[^0-9]'), '')))
                .toString();


            var Koordinat = '${_fonks.latitude}, ${_fonks.longtitude}';

            print(intValue);

            String guvende =
                "Merhaba, sizi yakını olarak ekleyen ${_counter
                .isimF} ${_counter
                .soyisimF} güvende olduğunu belirtti. Koordinatları: ${_fonks
                .latitude}, ${_fonks.longtitude} easyrescuer.com";
            String yardimmesaj =
                "SİZİ YAKINI OLARAK EKLEYEN ${_counter.isimF} ${_counter
                .soyisimF} 30DK BOYUNCA GÜVENDEYİM BUTONUNA BASMADI. YARDIMA İHTİYACI OLABİLİR. EĞER BU KİŞİNİN GÜVENLİĞİNDEN EMİNSENİZ LÜTFEN YAKINLARIM SEKMESİNDEN BU KİŞİ GÜVENDE BUTONUNA BASINIZ. Koordinatları: $Koordinat easyrescuer.com";


            print(guvende);




              //  Telephony.backgroundInstance.sendSms(to: "$intValue", message: "$yardimmesaj");



            //print(element.toString());

          });


print('YARDIM ÇAĞRISI ALINDI');


      }}

print('BUTON İZİNLERİ 1.Sİ SHAREDPR 2.GLOBAL VARIABLE : $bool2 -- ${_fonks.acilis}' );

      print('DEPREEEEEEEEEEEEMMMMMMMMMMMM ÇEKILDIIIIIIII: ${_counter.count.value}');


      if(bool2==true||(_fonks.acilis)==true||_counter.count.value>1) {

        _fonks.lokka();

        //_fonks.getCurrentLocation();
        //_fonks.DepremCekF();
        //_fonks.addDataF();

        print("$bool2 -------- $izinVerildimi");
      }
    });
  }
}



