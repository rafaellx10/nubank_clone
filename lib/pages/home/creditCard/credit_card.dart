import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';

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
          _textCreditCard(),
          _invoiceValue(),
          _limitAvaliable(),
          _installments(),
        ],
      ),
    );
  }

  _iconCreditCard() {
    return Icon(MdiIcons.creditCard, color: Colors.black, size: 30.0);
  }

  _textCreditCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Meus Cartões',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Icon(Icons.chevron_right, color: Colors.grey[600]),
      ],
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
          init: ControllerHomePage(),
          builder: (controllerHomePage) {
            return Text(
              controllerHomePage.creditCard,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            );
          },
        ),
      ],
    );
  }

  _limitAvaliable() {
    return GetBuilder<ControllerHomePage>(
      init: ControllerHomePage(),
      builder: (controllerHomePage) {
        return Text(
          'Limite disponível: ${controllerHomePage.limitCard}',
          style: TextStyle(fontSize: 16.0, color: Colors.grey),
        );
      },
    );
  }

  _installments() {
    return Container(
      margin: EdgeInsets.only(top: 4.0, bottom: 16.0),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        child: const Text(
          'Parcelar compras',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
