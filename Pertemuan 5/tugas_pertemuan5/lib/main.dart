import 'package:flutter/material.dart';
import 'package:tugas_pertemuan5/pages/home_page.dart';
import 'package:tugas_pertemuan5/pages/item_page.dart';
import 'package:tugas_pertemuan5/models/item.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => ItemPage(),
    },
  ));
}
