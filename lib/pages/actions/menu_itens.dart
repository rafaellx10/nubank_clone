import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class MenuItens extends StatefulWidget {
  const MenuItens({super.key});

  @override
  State<MenuItens> createState() => _MenuItensState();
}

class _MenuItensState extends State<MenuItens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            _itemMenu(icon: MdiIcons.clover, name: 'Área Pix', isFirst: true),
            _itemMenu(icon: MdiIcons.barcode, name: 'Pagar'),
            _itemMenu(icon: MdiIcons.cash, name: 'Transferir'),
            _itemMenu(icon: MdiIcons.cash, name: 'Depositar'),
            _itemMenu(icon: MdiIcons.creditCard, name: 'Recarga'),
            _itemMenu(icon: MdiIcons.account, name: 'Cobrar'),
            _itemMenu(icon: MdiIcons.chartBar, name: 'Investir'),
            _itemMenu(icon: MdiIcons.heartOutline, name: 'Doação'),
          ],
        ),
      ),
    );
  }

  _itemMenu({required IconData icon, required String name, bool? isFirst}) {
    return Container(
      padding:
          (isFirst ?? false)
              ? const EdgeInsets.only(right: 7, left: 20)
              : EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              icon: Icon(icon, color: Colors.black, size: 30.0),
              onPressed: () => print('onPressed: Transferir'),
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
