import 'package:flutter/material.dart';

class Item {
  String name;
  int price;
  String desc;
  AssetImage img;

  Item(
      {required this.name,
      required this.price,
      required this.desc,
      required this.img});
}
