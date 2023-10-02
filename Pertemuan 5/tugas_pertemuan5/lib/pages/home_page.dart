import 'package:flutter/material.dart';
import 'package:tugas_pertemuan5/models/item.dart';
import 'package:tugas_pertemuan5/widgets/cardItem.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Skintific MSH Niacinamide Moisture Gel',
        price: 130000,
        img: AssetImage('assets/images/skintific.jpg'),
        desc: 'Moisturizer'),
    Item(
        name: 'Esqa Mauve Eyeshadow Pallete',
        price: 120000,
        img: AssetImage('assets/images/esqa.jpg'),
        desc: 'Make-up'),
    Item(
        name: 'COSRX Snail Mucin Essense',
        price: 199000,
        img: AssetImage('assets/images/W1_BJ_Artikel_COSRX_Snail_essence.jpg'),
        desc: 'essence')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skincare Collection by Niken"),
        backgroundColor: Color.fromARGB(255, 7, 75, 107),
        actions: <Widget>[Image.asset('images/assets/girl.png')],
      ),
      body: Container(
        // margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/item',
                  arguments: item, //mengirim objek item ke item_page.dart
                );
              },
              child:
                  CardItem(item: item), //widget ItemCard untuk menampilkan item
            );
          },
        ),
      ),
    );
  }
}
