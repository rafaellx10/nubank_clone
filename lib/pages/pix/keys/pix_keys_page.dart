import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class PixKeysPage extends StatelessWidget {
  const PixKeysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas chaves Pix'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Chaves cadastradas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _keyItem(icon: MdiIcons.cardAccountDetails, type: 'CPF', value: '***.123.***-**'),
          _keyItem(icon: MdiIcons.emailOutline, type: 'E-mail', value: 'rafael****@email.com'),
          _keyItem(icon: MdiIcons.cellphone, type: 'Celular', value: '(11) *****-4321'),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              print('Cadastrar nova chave Pix');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fluxo de cadastro de chave (mock).')),
              );
            },
            child: const Text('Cadastrar nova chave'),
          ),
        ],
      ),
    );
  }

  Widget _keyItem({required IconData icon, required String type, required String value}) {
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
                Text(type, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
