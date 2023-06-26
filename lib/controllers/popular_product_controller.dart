import 'package:dinedrop_app/controllers/cart_controller.dart';
import 'package:dinedrop_app/model/popular_products_model.dart';
import 'package:dinedrop_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../model/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartitems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      // print("yea boy");
      _popularProductList.addAll(product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIngrement) {
    if (isIngrement) {
      // print("Increment" + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
      print("Number of items " + _quantity.toString());
    } else {
      // print("decrement" + _quantity.toString());
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (inCartitems + quantity < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if (inCartitems + quantity > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    //get from storaae
    // print("exist or not " + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    // print("the quantity in the cart is" + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("The id is " +
          value.id.toString() +
          "The quantity is " +
          value.quantity.toString());
    });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
