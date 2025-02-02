import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/chooseLocation.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
    initialRoute: '/',

  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));
