class Item {
  late int _id;
  late String _name;
  late int _price;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  get price => this._price;
  set price(value) => this._name = value;

  // konstruktor versi 1
  Item(this._name, this._price);

  //konstruktor versi 2
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._price = map['price'];
  }

  //konversi dari item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map['id'] = this._id;
    map['name'] = name;
    map['price'] = price;
    return map;
  }
}
