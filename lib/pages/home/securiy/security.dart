import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class SecurityLife extends StatelessWidget {
  const SecurityLife({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Wrap(
        direction: Axis.vertical,
        spacing: 12.0,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Text(
            'Seguros',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'Proteção para você cuidar do que importa',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          _securityButton(context),
        ],
      ),
    );
  }

  _securityButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(MdiIcons.heartOutline, color: Colors.black, size: 30.0),
              SizedBox(width: 10.0),
              Text(
                'Seguro de vida',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Text(
            'Connhecer',
            style: TextStyle(
              fontSize: 16.0,
              color: backgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
