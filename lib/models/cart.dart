import 'dart:convert';

import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale

  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom FREAK',
        price: 236,
        imgPath: 'lib/images/zoom_freak.png',
        description:
            'The forward-thining design of his latest signature shoe.'),
    Shoe(
        name: 'Kotrey Nike',
        price: 230,
        imgPath: 'lib/images/kotrey.png',
        description:
            'The forward-thining design of his latest signature shoe.'),
    Shoe(
        name: 'Kyrie Nike',
        price: 245,
        imgPath: 'lib/images/shoes_one.png',
        description:
            'The forward-thining design of his latest signature shoe.'),
    Shoe(
        name: 'Air Jordan',
        price: 270,
        imgPath: 'lib/images/shoes_two.png',
        description:
            'The forward-thining design of his latest signature shoe.'),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // Constructor to initialize the cart by loading it from SharedPreferences
  Cart() {
    _loadCartFromPreferences();
  }

  // get list of shoes for sale

  List<Shoe> getShopList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCard() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    _saveCardtoPreferences();
    notifyListeners();
  }

  // remove item from cart
  void removeItem(Shoe shoe) {
    userCart.remove(shoe);
    _saveCardtoPreferences();
    notifyListeners();
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in userCart) {
      total += item.price;
    }
    return total;
  }

  // save card to the shared preferences
  Future<void> _saveCardtoPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // convert the list of shoes to a list of json String
    List<String> cartJson =
        userCart.map((shoe) => json.encode(shoe.toJson())).toList();

    // Save the list of JSON strings to SharedPreferences
    prefs.setStringList('user_cart', cartJson);
  }

  // Load the cart from SharedPreferences
  Future<void> _loadCartFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the list of JSON strings from SharedPreferences
    List<String>? cartJson = prefs.getStringList('user_cart');

    if (cartJson != null) {
      // Convert the list of JSON strings back to a list of Shoe objects
      userCart =
          cartJson.map((shoe) => Shoe.fromJson(json.decode(shoe))).toList();
      notifyListeners(); // Notify listeners to update the UI
    }
  }
}
