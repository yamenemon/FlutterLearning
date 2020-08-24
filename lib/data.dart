import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Data extends ChangeNotifier {
  int value = 0;

  increment() {
    value++;
    notifyListeners();
  }
}
