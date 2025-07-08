import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 10.0,
        spacing: 10.0,
        children: [
          _iconCreditCard(),
          _textCreditCard(),
          _invoiceText(),
          _invoiceValue(),
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

  _invoiceText() {
    return Row(
      children: [
        Text(
          'Fatura atual',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      ],
    );
  }

  _invoiceValue() {
    return Row(
      children: [
        Text(
          '5000',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
