import 'package:get/get.dart';

class MainNavButtonController extends GetxController {
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void changeIndex(int index) {
    _selectedIndex.value = index;
    update();
  }

  // * MOVE TO HOME SCREEN
  void moveToHome() {
    _selectedIndex.value = 0;
    update();
  }

  // * MOVE TO CATEGORY SCREEN
  void moveToCategory() {
    _selectedIndex.value = 1;
    update();
  }

  // * MOVE TO CART SCREEN
  void moveToCart() {
    _selectedIndex.value = 2;
    update();
  }

  // * MOVE TO WISHLIST SCREEN
  void moveToWishlist() {
    _selectedIndex.value = 3;
    update();
  }
}
