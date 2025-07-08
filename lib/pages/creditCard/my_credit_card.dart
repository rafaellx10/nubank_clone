import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class MyCreditCard extends StatefulWidget {
  const MyCreditCard({super.key});

  @override
  State<MyCreditCard> createState() => _MyCreditCardState();
}

class _MyCreditCardState extends State<MyCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.fromLTRB(16, 10, 20, 10),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Icon(MdiIcons.creditCard, color: Colors.black, size: 30.0),
          SizedBox(width: 12.0),
          Text(
            'Meus Cartões',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
