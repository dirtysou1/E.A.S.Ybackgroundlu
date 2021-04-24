import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'counter_service.dart';
import 'plugins_utils/Location.dart';


Future<void> backgroundMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  CounterService.instance().startCounting();


}
