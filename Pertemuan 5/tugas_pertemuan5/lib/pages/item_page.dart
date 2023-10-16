import 'package:tugas_pertemuan5/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil nilai yang dikirimkan dari halaman sebelumnya
    final Item itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Item'),
        backgroundColor: Color.fromARGB(255, 149, 195, 255),
        actions: <Widget>[Image.asset('assets/images/girl.png')],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(image: itemArgs.img),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 4),
                      child: Text('${itemArgs.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        'From \$${itemArgs.price}',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        '${itemArgs.desc}',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
