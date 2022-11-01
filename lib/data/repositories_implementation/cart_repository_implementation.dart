import 'package:flutter/material.dart';
import 'package:pharmacy/data/repositories/cart_repository.dart';
import 'package:pharmacy/screens/product_info.dart';

import '../../constants/custom_images.dart';
import '../models/product_model.dart';

class CartRepositoryImplementation extends CartRepository with ChangeNotifier {
  /// creates a single instance of the list of products in the cart
  static List<ProductModel>? _cartList = <ProductModel>[];

  /// Provides the private variable [_cartList] for external interactions
  List<ProductModel>? get cartList => List.unmodifiable(_cartList ?? []);

  /// Total price of all products in the cart list
  double get totalPrice => getTotalPrice();


  /// Returns number of items in cartList
  int getLengthOfCartList() {
    if (_cartList == null) return 0;
    return _cartList!.length;
  }

  /// Provides total price of cart items
  double getTotalPrice() {
    double initialPrice = 0.00;
    if(_cartList == null) return initialPrice;
    _cartList?.forEach((element) { initialPrice += element.noOfItemsInCart * element.price; });
    return initialPrice;
  }

  /// Adds a product to the cart
  @override
  bool addProductToCart(ProductModel product) {
    if(_cartList == null) {
      _cartList?.add(product);
      notifyListeners();
      return true;
    }
    if (!_cartList!.contains(product)) {
      _cartList?.add(product);
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Removes a product from the cart
  @override
  void removeProductFromCart(String productId) {

    _cartList?.removeWhere((element) => element.productId == productId);
    notifyListeners();
  }

  /// Provides all the items of the cart
  @override
  List<ProductModel>? getList() {
    return cartList;
  }

  /// Updates the product item count in the cart list
  @override
  void updateProductItemCount(String productId, int numberOfItems) {
    _cartList
        ?.singleWhere((element) => element.productId == productId)
        .noOfItemsInCart = numberOfItems;
    notifyListeners();
  }

  @override
  void close() {}

  @override
  Future init() {
    return Future.value(null);
  }
}
