import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class CardsInstallmentsPage extends StatelessWidget {
  const CardsInstallmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parcelar compras'), backgroundColor: backgroundColor, foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Simulação de parcelamento', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _item('Compra Mercado', 'R\$ 650,00', '12x de R\$ 66,20'),
          _item('Compra Viagem', 'R\$ 1.280,00', '10x de R\$ 141,90'),
        ],
      ),
    );
  }

  Widget _item(String title, String total, String installments) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: greyColor, borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(total),
        Text(installments, style: const TextStyle(color: Colors.black54)),
      ]),
    );
  }
}
