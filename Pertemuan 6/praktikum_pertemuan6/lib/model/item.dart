// ignore_for_file: unnecessary_this, prefer_collection_literals

class Item {
  int? _id;
  String nama = "";
  int pricing = 0;

  int? get id => _id;
  String get name => nama;
  set name(String value) => nama = value;
  int get price => pricing;
  set price(int value) => pricing = value;

  Item(this.nama, this.pricing);

  Item.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    nama = map['name'];
    pricing = map['price'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': nama,
      'price': pricing,
    };
    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }
}
