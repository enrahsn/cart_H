import 'package:flutter/material.dart';

import 'item.dart';

class Cart with ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;
  // List<Item> get items => _items;

  void add(Item item) {
    _items.add(item);
_price += item.price;
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  int get count => _items.length;

  double get totalprice => _price;
}
