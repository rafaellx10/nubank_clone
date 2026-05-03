import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class CardsLimitPage extends StatelessWidget {
  const CardsLimitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustar limite'), backgroundColor: backgroundColor, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ControllerHomePage>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Limite atual: ${controller.limitCard}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 12),
                const Text('Este ajuste e mock local para testes.'),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.adjustLimitRandomly();
                      print('Limite ajustado no mock');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: backgroundColor, foregroundColor: Colors.white),
                    child: const Text('Ajustar limite'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
