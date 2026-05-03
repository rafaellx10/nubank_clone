import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class PixLimitsPage extends StatelessWidget {
  const PixLimitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus limites Pix'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Limites atuais (mock)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _limitCard('Diurno', 'R\$ 8.000,00'),
          _limitCard('Noturno', 'R\$ 1.500,00'),
          _limitCard('Transferência por transação', 'R\$ 2.000,00'),
          const SizedBox(height: 10),
          const Text(
            'Você pode solicitar ajuste dos limites. Esta ação está simulada.',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              print('Solicitar ajuste de limites Pix');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Solicitação de ajuste enviada (mock).')),
              );
            },
            child: const Text('Solicitar ajuste'),
          ),
        ],
      ),
    );
  }

  Widget _limitCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
