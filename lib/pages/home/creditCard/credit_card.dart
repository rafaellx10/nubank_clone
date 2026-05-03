import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
import 'package:nubank_clone/pages/cards/cards_page.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 10.0,
        spacing: 10.0,
        children: [
          _iconCreditCard(),
          _textCreditCard(context),
          _invoiceValue(),
          _limitAvaliable(),
          _installments(context),
        ],
      ),
    );
  }

  _iconCreditCard() {
    return Icon(MdiIcons.creditCard, color: Colors.black, size: 30.0);
  }

  Widget _textCreditCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Abrindo Meus Cartoes');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CardsPage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Meus Cartões',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[600]),
        ],
      ),
    );
  }

  _invoiceValue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fatura atual',
          style: TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
        SizedBox(height: 4.0),
        GetBuilder<ControllerHomePage>(
          builder: (controllerHomePage) {
            final value =
                controllerHomePage.eyeValue
                    ? controllerHomePage.creditCard
                    : 'R\$ ••••••••';

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Text(
                value,
                key: ValueKey<String>(value),
                style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }

  _limitAvaliable() {
    return GetBuilder<ControllerHomePage>(
      builder: (controllerHomePage) {
        final value =
            controllerHomePage.eyeValue
                ? 'Limite disponível: ${controllerHomePage.limitCard}'
                : 'Limite disponível: R\$ ••••••••';

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Text(
            value,
            key: ValueKey<String>(value),
            style: const TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        );
      },
    );
  }

  Widget _installments(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Abrindo Meus Cartoes para parcelamento');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CardsPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 4.0, bottom: 16.0),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          child: const Text(
            'Parcelar compras',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
