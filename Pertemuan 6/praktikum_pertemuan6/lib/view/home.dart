// ignore_for_file: unnecessary_this, unnecessary_null_comparison, prefer_const_constructors, prefer_conditional_assignment, use_key_in_widget_constructors, deprecated_member_use, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:database_sqlite/dbhelper.dart';
import 'package:database_sqlite/view/entry_form.dart';
import 'package:database_sqlite/model/item.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item> itemList = [];

  final warna1 = Color.fromARGB(255, 88, 4, 43);
  final warna2 = Color.fromARGB(255, 206, 105, 139);
  final warna3 = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Niken`s List Item'),
        backgroundColor: warna1,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: createListView(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: warna1,
                  onPrimary: warna3,
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Text(
                  "Tambah Item (+)",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  var item = await navigateToEntryForm(context, true, null);
                  if (item != null) {
                    int result = await dbHelper.insert(item);
                    if (result > 0) {
                      updateListView();
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Item?> navigateToEntryForm(
      BuildContext context, bool isAdding_niken, Item? item) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EntryForm(item: item, isAdding_niken: isAdding_niken);
        },
      ),
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5!;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Card(
            color: warna2,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 48, 1, 1),
                child: Icon(Icons.shopping_bag),
              ),
              title: Text(
                this.itemList[index].name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                this.itemList[index].price.toString(),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () async {
                  int result = await dbHelper.delete(this.itemList[index].id!);
                  if (result > 0) {
                    updateListView();
                  }
                },
              ),
              onTap: () async {
                var item = await navigateToEntryForm(
                    context, false, this.itemList[index]);
                if (item != null) {
                  int result = await dbHelper.update(item);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }

  void updateListView() async {
    final items = await dbHelper.getItemList();
    setState(() {
      itemList = items;
      count = items.length;
    });
  }
}
