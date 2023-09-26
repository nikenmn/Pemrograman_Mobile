import 'package:flutter/material.dart';
import 'package:tugas_pertemuan5/main.dart';
import 'package:tugas_pertemuan5/models/item.dart';

class Homepage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Skintific MSH Niacinamide Moisture Gel',
        price: 130000,
        imagePath: 'assets/images/skintific-niacin.jpg',
        desc: 'Moisturiser'),
    Item(
        name: 'Esqa Mauve Eyeshadow Pallete',
        price: 120000,
        imagePath: 'assets/images/esqa-mauve.jpg',
        desc: 'Make-up'),
    Item(
        name: 'COSRX Snail Mucin Essense',
        price: 199000,
        imagePath: 'assets/images/Cosrx-Snail-Mucin-Essence-Review.jpg',
        desc: 'essence')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Produk'),
        backgroundColor: const Color.fromARGB(255, 223, 173, 231),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, int index) {
            final item = items[index];
            return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/item', arguments: item);
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.asset(
                          item.imagePath,
                          height: 50,
                          width: 50,
                        )),
                        Expanded(child: Text(item.name)),
                        Expanded(
                          child: Text(
                            item.price.toString(),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
