import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class EventStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }


  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/events.txt');
  }

  Future<dynamic> readEvents() async {
    try{
      final file = await _localFile;

      String contents = await file.readAsString();
      print('$contents');
      return contents;
    } catch (e) {
      return 'error';
    }
  }

  Future<File> writeEvent(String event) async {
    final file = await _localFile;

    return file.writeAsString('$event');
  }
}