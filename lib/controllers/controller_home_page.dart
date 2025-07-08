import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  String saldo = 'R\$ 862.322,20';
  String creditCard = 'R\$ 25.000,00';
  String limitCard = 'R\$ 80.000,00';
  bool eyeValue = true;

  void toggleEyeValue() {
    eyeValue = !eyeValue;
    update();
  }
}
