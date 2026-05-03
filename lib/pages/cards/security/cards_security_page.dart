import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class CardsSecurityPage extends StatelessWidget {
  const CardsSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloquear cartão'), backgroundColor: backgroundColor, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ControllerHomePage>(
          builder: (controller) {
            final blocked = controller.isPhysicalCardBlocked;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blocked ? 'Seu cartão está bloqueado' : 'Seu cartão está ativo',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text('Use esta opção para simular bloqueio e desbloqueio.'),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.togglePhysicalCardLock();
                      print('Toggle bloqueio cartao');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blocked ? Colors.green : Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(blocked ? 'Desbloquear cartão' : 'Bloquear cartão'),
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
