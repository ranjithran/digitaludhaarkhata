import 'dart:convert';

import 'package:digitaludhaarkhata/Core/FileLoader/FielLoader.dart';
import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/models/Data/CustomerJson.dart';

class CreatingCustomer {
  final FileLoader _fileloader = locator<FileLoader>();

  Future<void> creatingCustomer(int id, String name) async {
    final _file = await _fileloader.loadingFile();
    Map<String, CustomerJson> _c = new Map();
    var _data = {
      "$id": CustomerJson(
        name: "$name",
        phonenumber: 000000,
        data: {
          
        },
      )
    };
    
    try {
      Stream<List<int>> inputStream = _file.openRead();
      inputStream
          .transform(utf8.decoder) // Decode bytes to UTF-8.
          .transform(new LineSplitter()) // Convert stream to individual lines.
          .listen((String line) {
        // Process results.
        if (line.isNotEmpty) {
          _c = customerJsonFromJson(line);
          _c.addAll(_data);
          print(_c);
        }
        {
          _c.addAll(_data);
        }
      }, onDone: () {
        _file.writeAsString(customerJsonToJson(_c).toString(), encoding: utf8);
        print("done");
      }, onError: (e) {
        print(e.toString());
      });
    } catch (e) {
      return null;
    }
    // creatingList();
  }

  Future<void> creatingCustomerEntries(int id,int gave,int got,int status) async {
    final _file = await _fileloader.loadingFile();
    Map<String, CustomerJson> _c = new Map();

    try {
      Stream<List<int>> inputStream = _file.openRead();
      inputStream
          .transform(utf8.decoder) // Decode bytes to UTF-8.
          .transform(new LineSplitter()) // Convert stream to individual lines.
          .listen((String line) {
        // Process results.
        if (line.isNotEmpty) {
          _c = customerJsonFromJson(line);
          _c[id.toString()].data.addAll({DateTime.now().toString(): Datum(gave: gave,got: got,status: status)});
          print(_c);
        }
      }, onDone: () {
        _file.writeAsString(customerJsonToJson(_c).toString(), encoding: utf8);
        print("done");
      }, onError: (e) {
        print(e.toString());
      });
    } catch (e) {
      return null;
    }
    // creatingList();
  }
  Future<void> deleting(String datatiem,int id,) async {
    final _file = await _fileloader.loadingFile();
    Map<String, CustomerJson> _c = new Map();

    try {
      Stream<List<int>> inputStream = _file.openRead();
      inputStream
          .transform(utf8.decoder) // Decode bytes to UTF-8.
          .transform(new LineSplitter()) // Convert stream to individual lines.
          .listen((String line) {
        // Process results.
        if (line.isNotEmpty) {
          _c = customerJsonFromJson(line);
          _c[id].data.remove(datatiem);
        }
      }, onDone: () {
        _file.writeAsString(customerJsonToJson(_c).toString(), encoding: utf8);
        print("done");
      }, onError: (e) {
        print(e.toString());
      });
    } catch (e) {
      return null;
    }
  }
  
}
