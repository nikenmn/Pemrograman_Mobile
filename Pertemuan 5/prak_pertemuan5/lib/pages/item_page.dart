import 'package:flutter/material.dart';
import 'package:tugas_pertemuan5/models/item.dart';

class Itempage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Route'),
          onPressed: () {},
        ),
      ),
    );
  }
}
