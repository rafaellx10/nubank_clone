import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class CardsPayInvoicePage extends StatelessWidget {
  const CardsPayInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagar fatura'), backgroundColor: backgroundColor, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Escolha como deseja pagar sua fatura.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const ListTile(title: Text('Total da fatura'), subtitle: Text('R\$ 25.000,00')),
            const ListTile(title: Text('Pagamento mínimo'), subtitle: Text('R\$ 2.500,00')),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Pagamento de fatura simulado');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pagamento simulado com sucesso!')));
                },
                style: ElevatedButton.styleFrom(backgroundColor: backgroundColor, foregroundColor: Colors.white),
                child: const Text('Pagar agora'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
