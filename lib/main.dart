import 'package:assignment2/test.dart';
import 'package:flutter/material.dart';
import 'package:assignment2/loadmovie.dart';
import 'package:assignment2/DetailedPage.dart';


void main(){
  runApp(MyApp());
}

Widget MyApp(){
  return MaterialApp(home:Scaffold(appBar:_appBar(),body:Body()));
}

Widget _appBar(){
  return AppBar(title:Text("Movies Review"),backgroundColor: Colors.redAccent.shade400,);
}

