  
import 'package:flutter/material.dart';

class SearchModel extends ChangeNotifier {
  bool _isSearching = false;
  String _keyword="";
  bool get isSearching => _isSearching;
  String get keyword => _keyword;

  void setBusy(bool value) {
    _isSearching=value;
    notifyListeners();
  }
  void setKeyword(String value) {
    _keyword = value;
   value.isNotEmpty? _isSearching=true:_isSearching=false;
    notifyListeners();
  }
}