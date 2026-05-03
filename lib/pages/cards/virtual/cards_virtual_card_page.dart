import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class CardsVirtualCardPage extends StatelessWidget {
  const CardsVirtualCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cartão virtual'), backgroundColor: backgroundColor, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ControllerHomePage>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.isVirtualCardEnabled ? 'Cartão virtual ativo' : 'Cartão virtual inativo',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  value: controller.isVirtualCardEnabled,
                  onChanged: (_) {
                    controller.toggleVirtualCard();
                    print('Toggle cartao virtual');
                  },
                  title: const Text('Ativar cartão virtual'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
