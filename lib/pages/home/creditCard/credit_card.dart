import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_iconCreditCard(), _textCreditCard()],
      ),
    );
  }

  _iconCreditCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Icon(MdiIcons.creditCard, color: Colors.black, size: 30.0),
    );
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
}
