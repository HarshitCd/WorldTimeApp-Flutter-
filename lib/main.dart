import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/loading_page.dart';
import 'pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLoc(),

  },
));
