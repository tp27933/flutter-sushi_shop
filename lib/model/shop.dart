import 'package:flutter/material.dart';
import 'package:sushi/model/food.dart';

class Shop extends ChangeNotifier{
 final  List<Food>  _foodMenu = [
    Food(
        name: 'Salmon sushi',
        price: '21.0',
        imagePath: 'lib/images/salmon.svg',
        rating: '8.5'),
    Food(
        name: 'Salmon sushi set',
        price: '21.0',
        imagePath: 'lib/images/salmon-set.svg',
        rating: '8.9')
  ];

  final List<Food> _cart = [];

  // getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart (Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}