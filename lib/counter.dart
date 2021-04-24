import 'dart:async';
import 'dart:convert';
import 'package:easy/views/LoginScreen.dart';
import 'package:easy/views/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:easy/plugins_utils/DeviceInfo.dart';
import 'package:easy/plugins_utils/Location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'main.dart';

class Counter {
  Counter() {
    _readCount().then((count) => _count.value = count);
    _readIzin().then((izin) => _izin.value = izin);
    _readisim().then((value) => _isim);

  }

  ValueNotifier<int> _count = ValueNotifier(0);

  ValueListenable<int> get count => _count;

  ValueNotifier<int> _izin = ValueNotifier(0);

  ValueListenable<int> get izin => _izin;

  String _isim,_soyisim,_numara,_id;

  String get isimF => _isim;
  String get soyisimF => _soyisim;
  String get numaraF => _numara;
  String get idF => _id;
  void increment() {
    _count.value++;
    _writeCount(_count.value);
    _izin.value++;
    _writeIzin(_izin.value);

  }

  Future<String> _readisim() async {
    var prefs = await SharedPreferences.getInstance();


      _isim = prefs.getString('isim');
      _soyisim = prefs.getString('soyisim');
      _numara = prefs.getString('tel');
      _id = prefs.getString('id');
      return prefs.getString('isim');


  }


  Future<int> _readCount() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Counter.count') ?? 0;
  }

  Future<int> _readIzin() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt('izin') ?? 0;
  }

  Future<void> _writeIzin(int izin) async {


    var prefs = await SharedPreferences.getInstance();
    return prefs.setInt('izin', izin);
  }

  Future<void> _writeCount(int count) async {


    var prefs = await SharedPreferences.getInstance();
    return prefs.setInt('Counter.count', count);
  }
}
