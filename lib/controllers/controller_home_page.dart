import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  String saldo = 'R\$ 862.322,20';
  bool eyeValue = true;

  void toggleEyeValue() {
    eyeValue = !eyeValue;
    update();
  }
}
