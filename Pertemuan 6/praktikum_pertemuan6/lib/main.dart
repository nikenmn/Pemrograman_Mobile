// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_function_literals_in_foreach_calls, unused_local_variable, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:praktikum_pertemuan6/database/dbhelper.dart';
import 'package:praktikum_pertemuan6/form_product.dart';
import 'package:praktikum_pertemuan6/list_product.dart';
import 'package:praktikum_pertemuan6/model/item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ListItemPage(),
    );
  }
}
