import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class PixStatementPage extends StatelessWidget {
  const PixStatementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato Pix'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Últimas movimentações',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _StatementItem(
            icon: MdiIcons.arrowTopRight,
            title: 'Transferência enviada',
            subtitle: 'Hoje, 14:25',
            value: '- R\$ 120,00',
            isPositive: false,
          ),
          _StatementItem(
            icon: MdiIcons.arrowBottomLeft,
            title: 'Transferência recebida',
            subtitle: 'Ontem, 19:12',
            value: '+ R\$ 500,00',
            isPositive: true,
          ),
          _StatementItem(
            icon: MdiIcons.receiptTextOutline,
            title: 'Pagamento Pix',
            subtitle: 'Ontem, 09:03',
            value: '- R\$ 89,90',
            isPositive: false,
          ),
        ],
      ),
    );
  }
}

class _StatementItem extends StatelessWidget {
  const _StatementItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.isPositive,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String value;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
