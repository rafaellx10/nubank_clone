import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/pages/pix/pix_page.dart';
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

  Widget _itemMenu({required IconData icon, required String name, bool? isFirst}) {
    return Container(
      padding:
          (isFirst ?? false)
              ? const EdgeInsets.only(right: 7, left: 20)
              : EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          _PressableMenuIcon(
            margin: const EdgeInsets.only(bottom: 10.0),
            onPressed: () => _handleMenuTap(name),
            child: Icon(icon, color: Colors.black, size: 30.0),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _handleMenuTap(String name) {
    if (name == 'Área Pix') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const PixPage()),
      );
      return;
    }

    print('onPressed: $name');
  }
}

class _PressableMenuIcon extends StatefulWidget {
  const _PressableMenuIcon({
    required this.child,
    required this.onPressed,
    required this.margin,
  });

  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets margin;

  @override
  State<_PressableMenuIcon> createState() => _PressableMenuIconState();
}

class _PressableMenuIconState extends State<_PressableMenuIcon> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _pressed ? 0.85 : 1,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 170),
          margin: widget.margin,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _pressed ? 0.24 : 0.08),
                blurRadius: _pressed ? 16 : 6,
                offset: Offset(0, _pressed ? 8 : 3),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
