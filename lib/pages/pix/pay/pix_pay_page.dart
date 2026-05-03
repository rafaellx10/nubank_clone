import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class PixPayPage extends StatefulWidget {
  const PixPayPage({super.key});

  @override
  State<PixPayPage> createState() => _PixPayPageState();
}

class _PixPayPageState extends State<PixPayPage> {
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void dispose() {
    _barcodeController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar com Pix'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Pagamento Pix',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _barcodeController,
            decoration: const InputDecoration(
              labelText: 'Código de pagamento',
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
              print('Pix pagar: codigo=${_barcodeController.text}, valor=${_valueController.text}');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pagamento Pix simulado com sucesso!')),
              );
            },
            child: const Text('Confirmar pagamento'),
          ),
        ],
      ),
    );
  }
}
