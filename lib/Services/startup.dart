import 'package:digitaludhaarkhata/Core/FileLoader/FielLoader.dart';
import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:flutter/services.dart';

class StartUP{
  StartUP(){
    onStartUp();
  }
  final FileLoader _fileLoader=locator<FileLoader>();
  Future<void> onStartUp() async {
    await _fileLoader.checkingFileStatus();
    
  }
}