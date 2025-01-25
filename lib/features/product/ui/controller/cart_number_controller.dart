import 'package:get/get.dart';

class CartNumberController extends GetxController{
  final RxInt cartNum = 0.obs;

  void increment(){
    cartNum.value++;
  }

  void decrement(){
    cartNum.value--;
  }
}