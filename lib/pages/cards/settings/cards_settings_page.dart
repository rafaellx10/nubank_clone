import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class CardsSettingsPage extends StatelessWidget {
  const CardsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações do cartão'), backgroundColor: backgroundColor, foregroundColor: Colors.white),
      body: ListView(
        children: const [
          ListTile(title: Text('Notificações de compra'), subtitle: Text('Ativadas'), trailing: Icon(Icons.chevron_right)),
          ListTile(title: Text('Compras por aproximação'), subtitle: Text('Ativadas'), trailing: Icon(Icons.chevron_right)),
          ListTile(title: Text('Cartão internacional'), subtitle: Text('Ativado'), trailing: Icon(Icons.chevron_right)),
          ListTile(title: Text('Senha do cartão'), subtitle: Text('Alterar senha'), trailing: Icon(Icons.chevron_right)),
        ],
      ),
    );
  }
}
