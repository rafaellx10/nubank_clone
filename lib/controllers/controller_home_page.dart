import 'dart:math';

import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  String saldo = 'R\$ 862.322,20';
  String creditCard = 'R\$ 25.000,00';
  String limitCard = 'R\$ 80.000,00';
  int invoiceDueInDays = 8;
  bool isPhysicalCardBlocked = false;
  bool isVirtualCardEnabled = true;
  bool eyeValue = true;
  final Random _random = Random();

  void toggleEyeValue() {
    eyeValue = !eyeValue;
    update();
  }

  Future<void> refreshData() async {
    await Future<void>.delayed(const Duration(milliseconds: 950));

    final saldoCents = _randomCents(min: 1500000, max: 120000000);
    final creditCents = _randomCents(min: 500000, max: 4500000);
    final limitCents = _randomCents(min: creditCents + 2500000, max: creditCents + 15000000);

    saldo = _formatCurrencyFromCents(saldoCents);
    creditCard = _formatCurrencyFromCents(creditCents);
    limitCard = _formatCurrencyFromCents(limitCents);
    invoiceDueInDays = 1 + _random.nextInt(12);

    update();
  }

  void togglePhysicalCardLock() {
    isPhysicalCardBlocked = !isPhysicalCardBlocked;
    update();
  }

  void toggleVirtualCard() {
    isVirtualCardEnabled = !isVirtualCardEnabled;
    update();
  }

  void adjustLimitRandomly() {
    final currentInvoiceCents = _currencyToCents(creditCard);
    final newLimitCents = _randomCents(
      min: currentInvoiceCents + 2500000,
      max: currentInvoiceCents + 18000000,
    );
    limitCard = _formatCurrencyFromCents(newLimitCents);
    update();
  }

  int _randomCents({required int min, required int max}) {
    return min + _random.nextInt(max - min + 1);
  }

  String _formatCurrencyFromCents(int cents) {
    final reais = cents ~/ 100;
    final decimal = (cents % 100).toString().padLeft(2, '0');
    final integer = reais.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < integer.length; i++) {
      final reverseIndex = integer.length - i;
      buffer.write(integer[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }

    return 'R\$ ${buffer.toString()},$decimal';
  }

  int _currencyToCents(String value) {
    final normalized = value
        .replaceAll('R\$', '')
        .replaceAll(' ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');
    final parsed = double.tryParse(normalized) ?? 0;
    return (parsed * 100).round();
  }
}
