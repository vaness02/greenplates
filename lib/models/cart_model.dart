// lib/models/cart_model.dart

import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];
  String _selectedSize = 'Small'; // Default size is 'small'

  List<Map<String, dynamic>> get items => _items;
  String get selectedSize => _selectedSize;

  void addItem(Map<String, dynamic> item) {
    print(
        'Adding item with totalPrice: ${item['totalPrice']}'); // Add this line
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAllItems() {
    _items.clear();
    notifyListeners();
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var item in _items) {
      // Add this line

      int itemPrice = item['price'];
      int itemQuantity = item['quantity'];
      if (item['size'] == 'Big') {
        itemPrice += 15000; // Add Rp 15.000 to the price if the size is 'big'
      }
      if (item['subscriptionDay'] != null && item['mealOption'] != null) {
        // Calculate total price for items with subscriptionDay and mealOption
        int days = 1;
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

        totalPrice += itemPrice * itemQuantity * days * meals;
      } else {
        // Calculate total price for items without subscriptionDay and mealOption
        totalPrice += itemPrice * itemQuantity;
      }
    }
    print('Total price: $totalPrice');
    return totalPrice;
  }

  void setSelectedSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }
}
