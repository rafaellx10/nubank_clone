import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class PixTransferPage extends StatefulWidget {
  const PixTransferPage({super.key});

  @override
  State<PixTransferPage> createState() => _PixTransferPageState();
}

class _PixTransferPageState extends State<PixTransferPage> {
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferir via Pix'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Dados da transferência',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _keyController,
            decoration: const InputDecoration(
              labelText: 'Chave Pix',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _valueController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Valor (R\$)',
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
              print('Pix transferir: chave=${_keyController.text}, valor=${_valueController.text}');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Transferência Pix simulada com sucesso!')),
              );
            },
            child: const Text('Confirmar transferência'),
          ),
        ],
      ),
    );
  }
}
