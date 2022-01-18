import 'package:flutter/foundation.dart';
import 'package:flutter_meedu/meedu.dart';

class CounterController extends SimpleNotifier {
  int counter = 0;
  String strDate = "";
  String strDate2 = "";

  CounterController() {
    if (kDebugMode) {
      print(':::Instancia creada de CounterController:::');
    }
  }

  void increment() {
    counter++;
    notify();
  }

  void getDate() {
    strDate = DateTime.now().toString();
    notify();
  }

  void getDate2() {
    strDate2 = DateTime.now().toString();
    notify(['actDate']);
  }
}
