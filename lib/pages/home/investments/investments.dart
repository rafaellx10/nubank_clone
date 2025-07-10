import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Investments extends StatelessWidget {
  const Investments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_textInvestments(), _investmentsValue(), _consultValues()],
      ),
    );
  }

  _textInvestments() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Investimentos',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Icon(MdiIcons.chevronRight, color: Colors.grey),
      ],
    );
  }

  _investmentsValue() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        'o jeito Nu de investir: sem asteriscos, \nlinguagem fácil e apartir de R\$ 1,00. Saiba mais.',
        style: TextStyle(fontSize: 16.0, color: Colors.grey),
      ),
    );
  }

  _consultValues() {
    return Container(
      margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(18.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(MdiIcons.cash, color: Colors.black, size: 30.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Consultar saldo para transferências',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
