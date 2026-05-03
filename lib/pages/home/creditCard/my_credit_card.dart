import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/pages/cards/cards_page.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class MyCreditCard extends StatefulWidget {
  const MyCreditCard({super.key});

  @override
  State<MyCreditCard> createState() => _MyCreditCardState();
}

class _MyCreditCardState extends State<MyCreditCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: () {
        print('Meus Cartoes tapped');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CardsPage()),
        );
      },
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.fromLTRB(16, 10, 20, 10),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _pressed ? 0.18 : 0.06),
                blurRadius: _pressed ? 20 : 8,
                offset: Offset(0, _pressed ? 10 : 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(MdiIcons.creditCard, color: Colors.black, size: 30.0),
              const SizedBox(width: 12.0),
              const Text(
                'Meus Cartões',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
