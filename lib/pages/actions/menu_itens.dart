import 'package:flutter/material.dart';
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
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () => print('onPressed: Transferir'),
                  ),
                ),
                Text(
                  'Transferir',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
