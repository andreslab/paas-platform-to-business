import 'package:flutter/material.dart';

class DashboardBar with ChangeNotifier {
  int _indexPage = 0;
  int _indexMenu = 0;

  get indexPage {
    return _indexPage;
  }

  set indexPage(int i) {
    this._indexPage = i;
    notifyListeners();
  }

  get indexMenu {
    return _indexMenu;
  }

  set indexMenu(int i) {
    this._indexMenu = i;
    notifyListeners();
  }
}
