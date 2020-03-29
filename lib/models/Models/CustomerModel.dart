import 'dart:math';

import 'package:digitaludhaarkhata/Core/FileLoader/FielLoader.dart';
import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/models/Data/CustomerData.dart';
import 'package:digitaludhaarkhata/models/Data/CustomerJson.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CustomerModel extends ChangeNotifier {
  String _statusbarstatus = "";

  int _stausvalue = 0;
  int _give = 0;
  int _get = 0;
  List<Customer> _names = new List();

  List<CustomerEntries> _entries = new List();

  List<Customer> get names => _names;

  List<CustomerEntries> get entries => _entries;

  String get statusBarStatus => _statusbarstatus;

  int get stausvalue => _stausvalue;
  int get give => _give;
  int get get => _get;
  final FileLoader _fileloader = locator<FileLoader>();

  creatingList() async {
    _names.clear();
    String nam;
    try {
      nam = await _fileloader.readingData();
    } catch (e) {
      _fileloader.writingOnMessage();
      nam = await _fileloader.readingData();
    }
    print("this is nam $nam");
    if (nam.isNotEmpty) {
      var data = customerJsonFromJson(nam);
      data.forEach((f, _data) => _names.add(new Customer(
          int.parse(f),
          int.parse(_data.phonenumber.toString()),
          _data.name,
          Random().nextInt(3))));
    }

    notifyListeners();
  }

  creatingEntries(int id) async {
    _entries.clear();
    print(id);
    var _nam = await _fileloader.readingData();
    var _data = customerJsonFromJson(_nam);
    _data["$id"].data.forEach((f, _data) => _entries.add(new CustomerEntries(
        DateFormat.yMMMMEEEEd()
                .format(DateTime(
                  int.parse(f.split(" ").first.split("-")[0]),
                  int.parse(f.split(" ").first.split("-")[1]),
                  int.parse(f.split(" ").first.split("-")[2]),
                  int.parse(f.split(" ").last.split(":")[0]),
                  int.parse(f.split(" ").last.split(":")[1]),
                  int.parse(f.split(" ").last.split(":")[2].split(".").first),
                ))
                .toString() +
            "-" +
            DateFormat.Hm().format(DateTime(
              int.parse(f.split(" ").first.split("-")[0]),
              int.parse(f.split(" ").first.split("-")[1]),
              int.parse(f.split(" ").first.split("-")[2]),
              int.parse(f.split(" ").last.split(":")[0]),
              int.parse(f.split(" ").last.split(":")[1]),
              int.parse(f.split(" ").last.split(":")[2].split(".").first),
            )),
        _data.gave,
        _data.got,
        _data.status)));
    _stausvalue=0;
    _statusbarstatus="";
    _data["$id"].data.forEach(
        (f, _data) => _stausvalue = _stausvalue + _data.gave - _data.got);
    if (_stausvalue.isNegative) {
      _statusbarstatus = "You Have to Give $_stausvalue";
    } else if (_stausvalue >= 1) {
      _statusbarstatus = "You Have to Get $_stausvalue";
    } else {
      _statusbarstatus = "Settled Up";
    }
    notifyListeners();
  }

  homeViewMoney(id) async {
    var _nam = await _fileloader.readingData();
    var _data = customerJsonFromJson(_nam);
    _data["$id"].data.forEach((f, _data) {
      _stausvalue = _stausvalue + _data.gave - _data.got;
    });
    notifyListeners();
  }

  statusbar() async {
    _get = 0;
    _give = 0;
    var _nam = await _fileloader.readingData();
    var _data = customerJsonFromJson(_nam);

    _data.forEach((f, _data) => _data.data.forEach((f, _data) {
          _get = _data.got + _get;
          _give = _data.gave + _give;
        }));
    notifyListeners();
  }
}
