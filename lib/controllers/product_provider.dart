import 'package:flutter/foundation.dart';

class ProductNotifier extends ChangeNotifier{
  int _activePage = 0;

  int get activePage=> _activePage;

  set activePage(int newIndex){
    _activePage= newIndex;
    notifyListeners();
  }
}