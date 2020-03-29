import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class FileLoader {
  Future<File> loadingFile() async {
    final _directory = await getApplicationDocumentsDirectory();
    final _path = _directory.path;
    return File('$_path/CustomerData.json');
  }

  Future<void> checkingFileStatus() async {
    final _file = await loadingFile();

    _file.open().catchError((onError){
      if(onError.toString().contains("No such file or directory")){
        _file.create();
      }
    });

    // return data;
  }

  Future<File> writingOnMessage() async {
    final file = await loadingFile();
    file.writeAsString("");
  }

  Future<String> readingData() async {
    final _file = await loadingFile();

    Future<String> data = _file.readAsString(encoding: utf8);
    return data;

    // return data;
  }


}
