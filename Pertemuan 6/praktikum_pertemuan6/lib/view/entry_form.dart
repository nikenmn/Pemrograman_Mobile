// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_this, no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:database_sqlite/model/item.dart';

class EntryForm extends StatefulWidget {
  final Item? item;
  final bool isAdding_niken;

  EntryForm({required this.item, required this.isAdding_niken});

  @override
  EntryFormState createState() =>
      EntryFormState(this.item, this.isAdding_niken);
}

class EntryFormState extends State<EntryForm> {
  Item? item;
  bool isAdding_niken;

  EntryFormState(this.item, this.isAdding_niken);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final warna1 = Color.fromARGB(255, 88, 4, 43);
  final warna2 = Color.fromARGB(255, 206, 105, 139);
  final warna3 = Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    if (!isAdding_niken && item != null) {
      nameController.text = item!.name;
      priceController.text = item!.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAdding_niken ? 'Add' : 'Edit'),
        backgroundColor: warna1,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: warna1,
                        onPrimary: warna3,
                      ),
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      onPressed: () {
                        if (isAdding_niken) {
                          item = Item(
                            nameController.text,
                            int.parse(priceController.text),
                          );
                        } else {
                          item!.name = nameController.text;
                          item!.price = int.parse(priceController.text);
                        }
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                  Container(width: 5.0),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: warna1,
                        onPrimary: warna3,
                      ),
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
