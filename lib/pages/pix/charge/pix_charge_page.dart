import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class PixChargePage extends StatefulWidget {
  const PixChargePage({super.key});

  @override
  State<PixChargePage> createState() => _PixChargePageState();
}

class _PixChargePageState extends State<PixChargePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cobrar com Pix'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Criar cobrança',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nome de quem vai pagar',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _valueController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Valor da cobrança (R\$)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              print('Pix cobrar: pagador=${_nameController.text}, valor=${_valueController.text}');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cobrança Pix criada (simulação)!')),
              );
            },
            child: const Text('Gerar cobrança'),
          ),
        ],
      ),
    );
  }
}
