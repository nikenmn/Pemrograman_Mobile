// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_element, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:praktikum_pertemuan6/form_product.dart';

import 'package:praktikum_pertemuan6/database/dbhelper.dart';
import 'package:praktikum_pertemuan6/model/item.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({Key? key}) : super(key: key);

  @override
  _ListItemPageState createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  List<Item> listItem = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    //menjalankan fungsi getallitem saat pertama kali dimuat
    _getAllItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Product App"),
        ),
      ),
      body: ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            Item item = listItem[index];
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 50,
                ),
                title: Text('${item.name}'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Email: ${item.price}"),
                    ),
                  ],
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button edit
                      IconButton(
                          onPressed: () {
                            _openFormEdit(item);
                          },
                          icon: Icon(Icons.edit)),
                      // button hapus
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          //membuat dialog konfirmasi hapus
                          AlertDialog hapus = AlertDialog(
                            title: Text("Information"),
                            content: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                      "Yakin ingin Menghapus Data ${item.name}")
                                ],
                              ),
                            ),
                            //terdapat 2 button.
                            //jika ya maka jalankan _deleteItem() dan tutup dialog
                            //jika tidak maka tutup dialog
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    _deleteItem(item, index);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ya")),
                              TextButton(
                                child: Text('Tidak'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          showDialog(
                              context: context, builder: (context) => hapus);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      //membuat button mengapung di bagian bawah kanan layar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }

  //mengambil semua data Kontak
  Future<void> _getAllItem() async {
    //list menampung data dari database
    var list = await db.getAllItem();

    //ada perubahanan state
    setState(() {
      //hapus data pada listItem
      listItem.clear();

      //lakukan perulangan pada variabel list
      list!.forEach((item) {
        //masukan data ke listItem
        listItem.add(Item.fromMap(item));
      });
    });
  }

  //menghapus data Kontak
  Future<void> _deleteItem(Item item, int position) async {
    await db.deleteItem(item.id!);
    setState(() {
      listItem.removeAt(position);
    });
  }

  // membuka halaman tambah Kontak
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormItem()));
    if (result == 'save') {
      await _getAllItem();
    }
  }

  //membuka halaman edit Kontak
  Future<void> _openFormEdit(Item item) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormItem(item: item)));
    if (result == 'update') {
      await _getAllItem();
    }
  }
}
