// lib/models/cart_model.dart

import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  List<Map> _items = [];

  List<Map> get items => _items;

  void addItem(Map item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Map item) {
    _items.remove(item);
    notifyListeners();
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var item in _items) {
      int days = 0;
      if (item['subscriptionDay'] == '7 Days') {
        days = 7;
      } else if (item['subscriptionDay'] == '15 Days') {
        days = 15;
      } else if (item['subscriptionDay'] == '30 Days') {
        days = 30;
      }

      int meals = 1;
      if (item['mealOption'] == 'Lunch & Dinner') {
        meals = 2;
      }

      totalPrice += (item['price'] * item['quantity'] * days * meals)
          as int; // Change 'qty' to 'quantity'
    }
    return totalPrice;
  }
}
