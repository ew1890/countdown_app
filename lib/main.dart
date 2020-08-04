import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/new_event.dart';
import 'pages/test.dart';

void main() =>
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/new_event': (context) => NewEvent(),
      '/test': (context) => Test(),
    },
  ));


